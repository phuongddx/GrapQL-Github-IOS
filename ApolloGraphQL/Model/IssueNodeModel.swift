//
//  IssueNodeModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper

class IssueNodeModel: Mappable {
    var id: String?
    var createdAt: String?
    var state: String?
    var title: String?
    var url: String?
    var author: PersonModel?
    var comments: IssueNodeCommentModel?
    var assignees: IssueAssigneesModel?
    var milestone: IssueMilestoneModel?
    var labels: IssueLabelsModel?
    
    required convenience init?(map: Map) {
        self.init()
        if let id = map.JSON["id"] as? String {
            self.id = id
        }
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
        assignees <- map["assignees"]
        milestone <- map["milestone"]
        labels <- map["labels"]
    }
}

extension IssueNodeModel {
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
