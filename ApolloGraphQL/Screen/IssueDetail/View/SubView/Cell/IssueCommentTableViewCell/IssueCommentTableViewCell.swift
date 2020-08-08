//
//  IssueCommentTableViewCell.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class IssueCommentTableViewCell: UITableViewCell {
    class func getIdentifier() -> String {
        return "IssueCommentTableViewCell"
    }
    
    @IBOutlet weak var avartarImageView: UIImageView!
    
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var updatedAtLb: UILabel!
    @IBOutlet weak var bodyTextLb: UILabel!
    
    private var comment: IssueCommentNodeDetailModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bodyTextLb.numberOfLines = 0
        avartarImageView.isCircleRadius()
    }
    
    func setupData(_ commentDetail: IssueCommentNodeDetailModel?) {
        self.comment = commentDetail
        didSetData()
    }
    
    func didSetData() {
        if let comment = comment, comment.isInvalidated == false {
            avartarImageView.downloadImage(from: comment.getAuthorAvatarUrl())
            nameLb.text = comment.getAuthorName()
            bodyTextLb.text = comment.getBodyText()
            updatedAtLb.text = comment.getUpdateAtTimeString()
        }
    }
}
