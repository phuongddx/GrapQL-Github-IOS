//
//  IssueParticipantsNodeModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueParticipantsNodeModel: Mappable {
    var person: PersonModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        person <- map["node"]
    }
}
