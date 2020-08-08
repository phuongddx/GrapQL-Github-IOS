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

protocol IssueDetailTableViewHeaderViewDelegate: class {
    func issueDetailTableViewHeaderViewDidUpdateBodyTextHeightConstraint(_ view: IssueDetailTableViewHeaderView)
}

class IssueDetailTableViewHeaderView: UIView {
    class func nibName() -> String {
        return "IssueDetailTableViewHeaderView"
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    private var issue: IssueNodeModel?
    private var datalist: [[String: Any]] = []
    var isAppened: Bool = false
    
    weak var delegate: IssueDetailTableViewHeaderViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        tableViewHeightConstraint.constant = 3 * IssueDetailHeaderTableViewCell.getHeight()
        
        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Utils.screenSize().width, height: 0.1))
        tableView.register(UINib.init(nibName: IssueDetailHeaderTableViewCell.getIdentifier(), bundle: Bundle.main), forCellReuseIdentifier: IssueDetailHeaderTableViewCell.getIdentifier())
        tableView.rowHeight = IssueDetailHeaderTableViewCell.getHeight()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }
    
    func setupData(_ issue: IssueNodeModel?) {
        self.issue = issue
        didSetIssue()
    }
    
    func didSetIssue() {
        if let issue = issue, issue.isInvalidated == false {
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
            if isAppened == false {
                isAppened = true
                datalist.append(assigneesDict)
                datalist.append(milestoneDict)
                datalist.append(labelsDict)
            }
        }
        updateView()
    }
    
    func updateView() {
        tableViewHeightConstraint.constant = CGFloat(datalist.count) * IssueDetailHeaderTableViewCell.getHeight()
        tableView.reloadData()
    }
}

extension IssueDetailTableViewHeaderView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IssueDetailHeaderTableViewCell.getIdentifier(), for: indexPath) as! IssueDetailHeaderTableViewCell
        cell.setupData(datalist[indexPath.row])
        cell.frame.size.width = Utils.screenSize().width
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.issueDetailTableViewHeaderViewDidUpdateBodyTextHeightConstraint(self)
    }
}
