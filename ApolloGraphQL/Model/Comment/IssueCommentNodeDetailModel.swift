//
//  IssueCommentNodeDetailModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssueCommentNodeDetailModel: Object, Mappable {
    @objc dynamic var id: String?
    @objc dynamic var author: PersonModel?
    @objc dynamic var bodyText: String?
    @objc dynamic var updatedAt: String?
    @objc dynamic var createdAt: String?
    @objc dynamic var resourcePath: String?
    @objc dynamic var url: String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
        if let id = map.JSON["id"] as? String {
            self.id = id
        }
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        bodyText <- map["bodyText"]
        if let updatedAt = map.JSON["updatedAt"] as? String {
            self.updatedAt = updatedAt.convertToDateTimeAgo()
        }
        createdAt <- map["createdAt"]
        resourcePath <- map["resourcePath"]
        url <- map["url"]
    }
}
