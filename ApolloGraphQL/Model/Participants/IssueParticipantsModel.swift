//
//  IssueParticipantsModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssueParticipantsModel: Object, Mappable {
    @objc dynamic var totalCount: Int = -1
    let participantList = List<PersonModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        totalCount <- map["totalCount"]
        if let edges = map.JSON["edges"] as? [[String: Any]] {
            for edge in edges {
                let map = Map.init(mappingType: .fromJSON, JSON: edge)
                if let node = IssueParticipantsNodeModel.init(map: map) {
                    node.mapping(map: map)
                    if let person = node.person {
                        person.mapping(map: map)
                        self.participantList.append(person)
                    }
                }
            }
        }
    }
}
