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
    
    private var comment: IssueCommentNodeDetailModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
}
