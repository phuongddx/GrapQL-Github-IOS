//
//  IssueDetailHeaderTableViewCell.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailHeaderTableViewCell: UITableViewCell {
    class func getIdentifier() -> String {
        return "IssueDetailHeaderTableViewCell"
    }
    
    class func getHeight() -> CGFloat {
        return 50.0
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var contentLb: UILabel!
    
    private var data: [String: Any] = [:]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupData(_ data: [String: Any]) {
        self.data = data
        didSetData()
    }
    
    private func didSetData() {
        if let id = data["id"] as? String {
            var titleStr: String = ""
            var contentStr: String = ""
            if id == IssueDataName.assignees.rawValue {
                titleStr = "Assigned"
                if let assignees = data["content"] as? IssueAssigneesModel {
                    if assignees.totalCount > 0 {
                        contentStr = assignees.getUsernameFirst()
                    }
                    else {
                        contentStr = "No Assigneed"
                    }
                }
            }
            else if id == IssueDataName.milestone.rawValue {
                titleStr = "Milestone"
                if let milestone = data["content"] as? IssueMilestoneModel {
                    contentStr = milestone.getTitle()
                }
                else {
                    contentStr = "No Milestones"
                }
            }
            else if id == IssueDataName.labels.rawValue {
                titleStr = "Labels"
                if let labels = data["content"] as? IssueLabelsModel, labels.totalCount > 0 {
                    contentStr = labels.getNameFirst()
                }
                else {
                    contentStr = "No Labels"
                }
            }
            contentLb.text = contentStr
            titleLb.text = titleStr
        }
    }
}
