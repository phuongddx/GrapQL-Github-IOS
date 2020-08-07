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
        if let createdAt = map.JSON["createdAt"] as? String {
            self.createdAt = createdAt.convertToDateTimeAgo()
        }
        creator <- map["creator"]
    }
}

extension IssueMilestoneModel {
    func getTitle() -> String {
        if let title = title, title.isEmpty == false {
            return title
        }
        return ""
    }
}
