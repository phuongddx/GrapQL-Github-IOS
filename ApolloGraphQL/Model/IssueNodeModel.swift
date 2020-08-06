//
//  IssueNodeModel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssueNodeModel: Object, Mappable {
    @objc dynamic var id: String?
    @objc dynamic var createdAt: String?
    @objc dynamic var state: String?
    @objc dynamic var title: String?
    @objc dynamic var url: String?
    @objc dynamic var author: PersonModel?
    @objc dynamic var comments: IssueNodeCommentModel?
    @objc dynamic var assignees: IssueAssigneesModel?
    @objc dynamic var milestone: IssueMilestoneModel?
    @objc dynamic var labels: IssueLabelsModel?
    @objc dynamic var participant: IssueParticipantsModel?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
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
        participant <- map["participants"]
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
    
    func getCountParticipant() -> Int {
        if let participant = participant {
            return participant.totalCount
        }
        return 0
    }
    
    func getTitle() -> String {
        if let title = title, title.count > 0 {
            return title
        }
        return ""
    }
}
