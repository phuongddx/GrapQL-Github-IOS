//
//  IssueDetailTableViewHeaderView.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

enum IssueDataName: String {
    case assignees = "assignees"
    case milestone = "milestone"
    case labels = "labels"
}

class IssueDetailTableViewHeaderView: UIView {
    class func nibName() -> String {
        return "IssueDetailTableViewHeaderView"
    }
    
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    private var issue: IssueNodeModel?
    private var datalist: [[String: Any]] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionLb.numberOfLines = 0
        backgroundColor = .white
        tableViewHeightConstraint.constant = CGFloat(datalist.count) * IssueDetailHeaderTableViewCell.getHeight()
    }
    
    func setupData(_ issue: IssueNodeModel?) {
        self.issue = issue
        didSetIssue()
    }
    
    func didSetIssue() {
        if let issue = issue, issue.isInvalidated == false {
            descriptionLb.text = issue.getBodyTextIssue()
            var assigneesDict: [String: Any] = [
                "id": IssueDataName.assignees.rawValue as String,
                "title": "Assignees" as String]
            if let assignees = issue.assignees, assignees.isInvalidated == false {
                assigneesDict.updateValue(assignees as IssueAssigneesModel, forKey: "content")
            }
            
            var milestoneDict: [String: Any] = [
                "id": IssueDataName.milestone.rawValue,
                "title": "Milestones"]
            if let milestone = issue.milestone, milestone.isInvalidated == false {
                milestoneDict.updateValue(milestone as IssueMilestoneModel, forKey: "content")
            }
            
            var labelsDict: [String: Any] = [
                "id": IssueDataName.labels.rawValue,
                "title": "Labels"]
            if let labels = issue.labels, labels.isInvalidated == false {
                labelsDict.updateValue(labels as IssueLabelsModel, forKey: "content")
            }
            datalist.append(assigneesDict)
            datalist.append(milestoneDict)
            datalist.append(labelsDict)
        }
        updateView()
    }
    
    func updateView() {
        tableViewHeightConstraint.constant = CGFloat(datalist.count) * IssueDetailHeaderTableViewCell.getHeight()
        tableView.reloadData()
    }
}
