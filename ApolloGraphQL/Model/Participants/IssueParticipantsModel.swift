//
//  IssueParticipantsModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueParticipantsModel: Mappable {
    var totalCount: Int = -1
    var participantList: [PersonModel] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        totalCount <- map["totalCount"]
        if let edges = map.JSON["edges"] as? [[String: Any]] {
            for edge in edges {
                let map = Map.init(mappingType: .fromJSON, JSON: edge)
                if let person = PersonModel.init(map: map) {
                    person.mapping(map: map)
                    self.participantList.append(person)
                }
            }
        }
    }
}
