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
    @objc dynamic var bodyText: String?
    
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
        bodyText <- map["bodyText"]
        url <- map["url"]
        title <- map["title"]
        state <- map["state"]
        if let createdAt = map.JSON["createdAt"] as? String {
            self.createdAt = createdAt.convertToDateTimeAgo()
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
    func getBodyTextIssue() -> String {
        if let bodyText = bodyText, bodyText.isEmpty == false {
            return bodyText
        }
        return ""
    }
    
    func getCreatedAtString() -> String {
        if let createdAt = createdAt, createdAt.isEmpty == false {
            return createdAt
        }
        return ""
    }
    
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
    
    func getAvatarAuhtorUrl() -> String {
        if let author = author, let url = author.avatarUrl, url.count > 0 {
            return url
        }
        return ""
    }
}
