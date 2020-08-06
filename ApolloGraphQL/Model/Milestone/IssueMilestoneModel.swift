//
//  IssueMilestoneModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueMilestoneModel: Mappable {
    var state: String?
    var title: String?
    var createdAt: String?
    var creator: PersonModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        state <- map["state"]
        title <- map["title"]
        createdAt <- map["createdAt"]
        creator <- map["creator"]
    }
}
