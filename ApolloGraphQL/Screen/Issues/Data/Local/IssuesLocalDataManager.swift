//
//  IssuesLocalDataManager.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

class IssuesLocalDataManager: IssuesLocalDataManagerProtocol {
    func initIssues() -> IssueList {
        let realm = try! Realm()
        return realm.objects(IssueNodeModel.self)
    }
}
