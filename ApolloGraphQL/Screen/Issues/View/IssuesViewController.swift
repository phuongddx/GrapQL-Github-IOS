//
//  IssuesViewController.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/5/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import Apollo
import RealmSwift

class IssuesViewController: UIViewController {
    
    static let storyBoardId: String = "IssuesViewController"
    static let storyBoardName: String = "Issues"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var presenter: IssuesPresenterProtocol?
    private var issueList: IssueList! {
        get {
            return presenter?.issueList
        }
    }
    
    private let refreshControl: UIRefreshControl = UIRefreshControl.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 0
        if let presenter = presenter {
            presenter.viewDidLoad()
            presenter.handleChangeStateIssue(index: 0)
        }
        
        refreshControl.tintColor = .darkGray
        tableView.addSubview(refreshControl)
        tableView.register(UINib.init(nibName: IssuesTableViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: IssuesTableViewCell.identifier)
        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.rowHeight = IssuesTableViewCell.height
        tableView.separatorColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        
    }
    
    @objc func reloadData() {
        presenter?.reloadData()
    }

    @IBAction func segmentedControl_ValueChanged(_ sender: Any) {
        if let presenter = presenter {
            presenter.handleChangeStateIssue(index: segmentedControl.selectedSegmentIndex)
        }
    }
}

extension IssuesViewController: IssuesViewProtocol {
    func updateView() {
        tableView.reloadData()
    }
    
    func beginLoading() {
        refreshControl.beginRefreshing()
    }
    
    func endLoading() {
        refreshControl.endRefreshing()
    }
}

extension IssuesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IssuesTableViewCell.identifier, for: indexPath) as! IssuesTableViewCell
        cell.frame.size.width = Utils.screenSize().width
        cell.selectionStyle = .none
        cell.setupData(issue: issueList[indexPath.row], indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let issue = issueList[indexPath.row]
        if let presenter = presenter {
            presenter.pushIssueDetail(issueId: issue.id!)
        }
    }
}
