//
//  IssueNodeCommentModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssueNodeCommentModel: Object, Mappable {
    @objc dynamic var totalCount: Int = -1
    let nodeDetailList = List<IssueCommentNodeDetailModel>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        totalCount <- map["totalCount"]
        if let edges = map.JSON["edges"] as? [[String: Any]] {
            if edges.count > 0 {
                for edge in edges {
                    let map = Map.init(mappingType: .fromJSON, JSON: edge)
                    if let node = IssueCommentNodeModel.init(map: map) {
                        node.mapping(map: map)
                        if let nodeDetail = node.nodeDetail {
                            self.nodeDetailList.append(nodeDetail)
                        }
                    }
                }
            }
        }
    }
}
