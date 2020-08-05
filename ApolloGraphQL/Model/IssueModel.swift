//
//  IssueModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/5/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueModel: Mappable {
    var node: IssuseNodeModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        node <- map["node"]
    }
}

class IssuseNodeModel: Mappable {
    var createdAt: String?
    var state: String?
    var title: String?
    var url: String?
    var author: IssueNodeAuthorModel?
    var comments: IssueNodeCommentModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        title <- map["title"]
        state <- map["state"]
        if let createdAt = map.JSON["createdAt"] as? String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from: createdAt)!
            self.createdAt = dateFormatter.string(from: date)
        }
        author <- map["author"]
        comments <- map["comments"]
    }
}

extension IssuseNodeModel {
    func getAuthorName() -> String {
        if let author = author, let username = author.username, username.count > 0 {
            return username
        }
        return ""
    }
    
    func getCountComment() -> Int {
        if let comment = comments {
            return comment.totalCount
        }
        return 0
    }
}

class IssueNodeAuthorModel: Mappable {
    var username: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        username <- map["login"]
    }
}

class IssueNodeCommentModel: Mappable {
    var totalCount: Int = -1
    var nodeDetailList: [IssueCommentNodeDetailModel] = []
    
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

class IssueCommentNodeModel: Mappable {
    var nodeDetail: IssueCommentNodeDetailModel?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        nodeDetail <- map["node"]
    }
    
}

class IssueCommentNodeDetailModel: Mappable {
    var author: IssueNodeAuthorModel?
    var bodyText: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        bodyText <- map["bodyText"]
    }
}
