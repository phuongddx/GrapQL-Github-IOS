//
//  IssueDetailLocalDataManager.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

class IssueDetailLocalDataManager: IssueDetailLocalDataManagerProtocol {
    func initIssueNode(with id: String) -> IssueNodeModel? {
        let realm = try! Realm()
        return realm.object(ofType: IssueNodeModel.self, forPrimaryKey: id)
    }
}
