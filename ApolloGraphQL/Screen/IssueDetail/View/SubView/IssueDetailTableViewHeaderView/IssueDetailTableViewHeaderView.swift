//
//  IssueDetailTableViewHeaderView.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class IssueDetailTableViewHeaderView: UIView {
    class func nibName() -> String {
        return "IssueDetailTableViewHeaderView"
    }
    
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var issue: IssueNodeModel?
    private var datalist: [[String: Any]] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func setupData(_ issue: IssueNodeModel) {
        self.issue = issue
        didSetIssue()
    }
    
    func didSetIssue() {
        if let issue = issue, issue.isInvalidated == false {
            
        }
    }
}
