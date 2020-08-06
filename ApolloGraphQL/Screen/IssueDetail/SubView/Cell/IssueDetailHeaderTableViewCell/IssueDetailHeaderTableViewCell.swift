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
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var contentLb: UILabel!
    
    private var issueDetail: IssueNodeModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
}
