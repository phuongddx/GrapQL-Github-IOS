//
//  IssueCommentNodeModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueCommentNodeModel: Mappable {
    var nodeDetail: IssueCommentNodeDetailModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        nodeDetail <- map["node"]
    }
}

