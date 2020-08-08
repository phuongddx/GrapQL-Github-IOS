//
//  IssueDetailTableViewFooterView.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailTableViewFooterView: UIView {
    class func nibName() -> String {
        return "IssueDetailTableViewFooterView"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var issue: IssueNodeModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.register(UINib.init(nibName: IssueCommentTableViewCell.getIdentifier(), bundle: Bundle.main), forCellReuseIdentifier: IssueCommentTableViewCell.getIdentifier())
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }
    
    func setupData(_ issue: IssueNodeModel?) {
        self.issue = issue
        didSetData()
    }
    
    func didSetData() {
        tableView.reloadData()
    }
}

extension IssueDetailTableViewFooterView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let issue = issue, issue.isInvalidated == false, let commentNode = issue.comments {
            return commentNode.totalCount
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IssueCommentTableViewCell.getIdentifier(), for: indexPath) as! IssueCommentTableViewCell
        cell.frame.size.width = Utils.screenSize().width
        if let issue = issue, issue.isInvalidated == false, let commentNode = issue.comments {
            cell.setupData(commentNode.nodeDetailList[indexPath.row])
        }
        return cell
    }
}
