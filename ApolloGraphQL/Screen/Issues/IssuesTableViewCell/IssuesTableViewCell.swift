//
//  IssuesTableViewCell.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/5/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class IssuesTableViewCell: UITableViewCell {
    static let identifier: String = "IssuesTableViewCell"
    static let height: CGFloat = 100
    
    @IBOutlet weak var issueNumberLb: UILabel!
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var stateLb: UILabel!
    @IBOutlet weak var authorNameLb: UILabel!
    
    @IBOutlet weak var countCommentLb: UILabel!
    @IBOutlet weak var createAtLb: UILabel!
    
    
    private var issue: IssueNodeModel?
    private var indexRow: Int = -1
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        issueNumberLb.numberOfLines = 0
        issueNumberLb.textAlignment = .center
        
    }
    
    func setupData(issue: IssueNodeModel,_ index: Int) {
        self.issue = issue
        self.indexRow = index
        didSetIssue()
    }
    
    private func didSetIssue() {
        var stateStr: String = ""
        var authorNameStr: String = ""
        var countCommentStr: String = ""
        var titleStr: String = ""
        if let issue = issue {
            if let state = issue.state, state.count > 0 {
                stateStr = state
            }
            authorNameStr = issue.getAuthorName()
            countCommentStr = "\(issue.getCountComment()) Comment"
            if let title = issue.title {
                titleStr = title
            }
            createAtLb.text = issue.getCreatedAtString()
        }
        let fullString = NSMutableAttributedString.init()
        fullString.append(NSAttributedString.init(string: "#\(indexRow + 1)\n", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium), .foregroundColor: UIColor.systemBlue]))
        fullString.append(NSAttributedString.init(string: "Issue", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium), .foregroundColor: UIColor.gray]))
        issueNumberLb.attributedText = fullString
        stateLb.text = stateStr
        authorNameLb.text = authorNameStr
        countCommentLb.text = countCommentStr
        titleLb.text = titleStr
    }
}
