//
//  IssueAssigneesModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueAssigneesModel: Mappable {
    var totalCount: Int = -1
    var assigneesList: [PersonModel] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        totalCount <- map["totalCount"]
        if let edges = map.JSON["edges"] as? [[String: Any]] {
            for edge in edges {
                let map = Map.init(mappingType: .fromJSON, JSON: edge)
                if let node = IssueAssigneesNodeModel.init(map: map) {
                    node.mapping(map: map)
                    if let assignees = node.node{
                        assignees.mapping(map: map)
                        self.assigneesList.append(assignees)
                    }
                }
            }
        }
    }
}

