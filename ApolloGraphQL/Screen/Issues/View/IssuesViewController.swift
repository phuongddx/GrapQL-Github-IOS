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

class IssuesViewController: UIViewController {
    
    static let storyBoardId: String = "IssuesViewController"
    static let storyBoardName: String = "Issues"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var issueList: [IssuseNodeModel] = []
    
    private let refreshControl: UIRefreshControl = UIRefreshControl.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loaddata()
        
        refreshControl.tintColor = .darkGray
        tableView.addSubview(refreshControl)
        tableView.register(UINib.init(nibName: IssuesTableViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: IssuesTableViewCell.identifier)
        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.rowHeight = IssuesTableViewCell.height
        tableView.separatorColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    @IBAction func segmentedControl_ValueChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        default:
            print("error")
        }
    }
    
    private func beginLoading() {
        refreshControl.beginRefreshing()
    }
    
    private func endLoading() {
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
}

extension IssuesViewController {
    private func loaddata() {
        let ownerStr: String = "phuongdateh"
        let nameRepo: String = "GrapQL-Github-IOS"
        beginLoading()
        loadListIssue(owner: ownerStr, nameRepo: nameRepo)
    }
    
    private func updateView() {
        tableView.reloadData()
    }
    
    private func loadListIssue(owner: String, nameRepo: String) {
        let query = ListIssueQuery.init(owner: owner, name: nameRepo, numberIssue: 100, states: [IssueState.closed])
        apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, context: nil, queue: .main) { [weak self] (results) in
            switch results {
            case .success(let results):
                if let data = results.data {
                    if let data = try? JSONSerialization.data(withJSONObject: data.jsonObject, options: []) {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                                let repository = json["repository"] as? [String: Any],
                                let issues = repository["issues"] as? [String: Any],
                                let edges = issues["edges"] as? [[String: Any]] {
                                for edge in edges {
                                    let map = Map.init(mappingType: .fromJSON, JSON: edge)
                                    if let issueModel = IssueModel.init(map: map) {
                                        issueModel.mapping(map: map)
                                        if let node = issueModel.node {
                                            if let weakSelf = self {
                                                weakSelf.issueList.append(node)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        }
                        catch let error {
                            print("error: \(error.localizedDescription)")
                        }
                    }
                    else {
                        print("json fail")
                    }
                }
                else {
                    print("pasre error")
                }
                if let weakSelf = self {
                    weakSelf.endLoading()
                    weakSelf.updateView()
                }
            case .failure(let error):
                if let weakSelf = self {
                    weakSelf.endLoading()
                }
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
