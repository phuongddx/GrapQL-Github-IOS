//
//  IssueLabelsDetailModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueLabelsDetailModel: Mappable {
    var id: String?
    var color: String?
    var createdAt: String?
    var description: String?
    var name: String?
    
    required convenience init?(map: Map) {
        self.init()
        if let id = map.JSON["id"] as? String {
            self.id = id
        }
    }
    
    func mapping(map: Map) {
        color <- map["color"]
        createdAt <- map["createdAt"]
        description <- map["description"]
        name <- map["name"]
    }
}
