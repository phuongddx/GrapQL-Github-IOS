//
//  IssueMilestoneModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssueMilestoneModel: Object, Mappable {
    @objc dynamic var state: String?
    @objc dynamic var title: String?
    @objc dynamic var createdAt: String?
    @objc dynamic var creator: PersonModel?
    
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
