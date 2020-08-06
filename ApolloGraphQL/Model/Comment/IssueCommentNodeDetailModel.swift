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
    var id: String?
    var author: PersonModel?
    var bodyText: String?
    var updatedAt: String?
    var createdAt: String?
    var resourcePath: String?
    var url: String?
    
    required convenience init?(map: Map) {
        self.init()
        if let id = map.JSON["id"] as? String {
            self.id = id
        }
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        bodyText <- map["bodyText"]
        updatedAt <- map["updatedAt"]
        createdAt <- map["createdAt"]
        resourcePath <- map["resourcePath"]
        url <- map["url"]
    }
}
