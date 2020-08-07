//
//  IssueDetailViewController.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/5/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailViewController: UIViewController {
    static let storyBoardName: String = "IssueDetail"
    static let storyBoardId: String = "IssueDetailViewController"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var updateTimeLb: UILabel!
    
    @IBOutlet weak var countCommentLb: UILabel!
    @IBOutlet weak var countParticipantLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var headerView: IssueDetailTableViewHeaderView?
    private var footerView: IssueDetailTableViewFooterView?
    private var issueObj: IssueNodeModel? {
        get {
            return presenter?.issueNode
        }
    }
    var presenter: IssueDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let presenter = presenter {
            presenter.viewDidload()
        }
        
        navigationController?.navigationBar.backgroundColor =  .black
        countParticipantLb.numberOfLines = 0
        countCommentLb.numberOfLines = 0
        avatarImageView.isCircleRadius()
        
        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.sectionFooterHeight = 100
        tableView.estimatedSectionFooterHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = 100
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
    }
}

extension IssueDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if headerView == nil {
            let view = Utils.viewFrom(IssueDetailTableViewHeaderView.nibName()) as! IssueDetailTableViewHeaderView
            headerView = view
            
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if footerView == nil {
            
        }
        return footerView
    }
    
}

extension IssueDetailViewController: IssueDetailViewProtocol {
    func updateView() {
        var titleStr: String = ""
        var countCommentStr: String = ""
        var countParticipantStr: String = ""
        var avatarAuthorUrlStr: String = ""
        if let issue = issueObj {
            if let title = issue.title, title.count > 0 {
                titleStr = title
            }
            countCommentStr = "\(issue.getCountComment())\n Comments"
            countParticipantStr = "\(issue.getCountParticipant())\n Participant"
            
            if let state = issue.state {
                if state == IssueState.open.rawValue {
                    
                }
                else if state == IssueState.closed.rawValue {
                    
                }
            }
            avatarAuthorUrlStr = issue.getAvatarAuhtorUrl()
            updateTimeLb.text = issue.getCreatedAtString()
        }
        titleLb.text = titleStr
        countCommentLb.text = countCommentStr
        countParticipantLb.text = countParticipantStr
        avatarImageView.downloadImage(from: avatarAuthorUrlStr)
    }
}
