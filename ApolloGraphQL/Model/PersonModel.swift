//
//  PersonModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class PersonModel: Object, Mappable {
    @objc dynamic var id: String?
    @objc dynamic var username: String?
    @objc dynamic var resourcePath: String?
    @objc dynamic var url: String?
    @objc dynamic var avatarUrl: String?
    
//    override class func primaryKey() -> String? {
//        return "id"
//    }
    
    required convenience init?(map: Map) {
        self.init()
        if let id = map.JSON["id"] as? String {
            self.id = id
        }
    }
    
    func mapping(map: Map) {
        username <- map["login"]
        avatarUrl <- map["avatarUrl"]
        url <- map["url"]
        resourcePath <- map["resourcePath"]
    }
}
