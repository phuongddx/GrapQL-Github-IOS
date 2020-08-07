//
//  IssueLabelsModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssueLabelsModel: Object, Mappable {
    @objc dynamic var totalCount: Int = -1
    let labelList = List<IssueLabelsDetailModel>()
    
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

extension IssueLabelsModel {
    func getNameFirst() -> String {
        if labelList.isInvalidated == false, labelList.count > 0, let name = labelList[0].name, name.isEmpty == false {
            return name
        }
        return ""
    }
}
