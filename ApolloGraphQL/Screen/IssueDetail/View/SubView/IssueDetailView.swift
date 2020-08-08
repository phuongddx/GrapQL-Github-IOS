//
//  IssueDetailView.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/8/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailView: UIView {
    static let nibName: String = "IssueDetailView"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var updateTimeLb: UILabel!
    
    @IBOutlet weak var countCommentLb: UILabel!
    @IBOutlet weak var countParticipantLb: UILabel!
    @IBOutlet weak var bodyTextLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var headerView: IssueDetailTableViewHeaderView?
    private var footerView: IssueDetailTableViewFooterView?
    
    
    private var issueObj: IssueNodeModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bodyTextLb.numberOfLines = 0
        countParticipantLb.numberOfLines = 0
        countCommentLb.numberOfLines = 0
        avatarImageView.isCircleRadius()

        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        tableView.estimatedSectionHeaderHeight = 150
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
    
    func setupData(_ issue: IssueNodeModel?) {
        self.issueObj = issue
        didSetData()
    }
    
    func didSetData() {
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
            bodyTextLb.text = issue.getBodyTextIssue()
        }
        titleLb.text = titleStr
        countCommentLb.text = countCommentStr
        countParticipantLb.text = countParticipantStr
        avatarImageView.downloadImage(from: avatarAuthorUrlStr)
        tableView.reloadData()
    }
}

extension IssueDetailView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if headerView == nil {
                let view = Utils.viewFrom(IssueDetailTableViewHeaderView.nibName()) as! IssueDetailTableViewHeaderView
                headerView = view
                headerView!.frame.size.width = Utils.screenSize().width
            }
            headerView!.setupData(issueObj)
            return headerView
        }
        return nil
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            let tmpLabel: UILabel = UILabel()
//            if let issue = issueObj, issue.isInvalidated == false {
//                tmpLabel.text = issue.getBodyTextIssue()
//            }
//            tmpLabel.numberOfLines = 0
//            tmpLabel.sizeToFit()
//            tmpLabel.layoutIfNeeded()
//            return tmpLabel.intrinsicContentSize.height + 150
//        }
//        return 0
//    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        let tmpLabel: UILabel = UILabel()
//        if let issue = issueObj, issue.isInvalidated == false {
//            tmpLabel.text = issue.getBodyTextIssue()
//        }
//        tmpLabel.numberOfLines = 0
//        tmpLabel.sizeToFit()
//        tmpLabel.layoutIfNeeded()
//        return tmpLabel.intrinsicContentSize.height + 200
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            if footerView == nil {
                let view = Utils.viewFrom(IssueDetailTableViewFooterView.nibName()) as! IssueDetailTableViewFooterView
                footerView = view
            }
            footerView!.setupData(issueObj)
            return footerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        81
        if let issue = issueObj, issue.isInvalidated == false, let comments = issue.comments {
            return CGFloat(comments.totalCount) * CGFloat(100)
        }
        return 0
    }
}
