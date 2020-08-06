//
//  IssueLabelsModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueLabelsModel: Mappable {
    var totalCount: Int = -1
    var labelList: [IssueLabelsDetailModel] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        totalCount <- map["totalCount"]
        if let nodes = map.JSON["nodes"] as? [[String: Any]] {
            for node in nodes {
                let map = Map.init(mappingType: .fromJSON, JSON: node)
                if let labelDetail = IssueLabelsDetailModel.init(map: map) {
                    labelDetail.mapping(map: map)
                    self.labelList.append(labelDetail)
                }
            }
        }
    }
}
