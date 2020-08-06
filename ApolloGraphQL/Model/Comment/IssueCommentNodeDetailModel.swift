//
//  IssueCommentNodeDetailModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueCommentNodeDetailModel: Mappable {
    var author: PersonModel?
    var bodyText: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        bodyText <- map["bodyText"]
    }
}
