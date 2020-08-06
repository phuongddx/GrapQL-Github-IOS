//
//  IssueLabelsDetailModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssueLabelsDetailModel: Object, Mappable {
    @objc dynamic var id: String?
    @objc dynamic var color: String?
    @objc dynamic var createdAt: String?
    @objc dynamic var desc: String?
    @objc dynamic var name: String?
    
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
        color <- map["color"]
        createdAt <- map["createdAt"]
        desc <- map["description"]
        name <- map["name"]
    }
}
