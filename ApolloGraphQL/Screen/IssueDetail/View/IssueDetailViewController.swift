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
