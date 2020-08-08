//
//  IssuesRemoteDataManager.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class IssuesRemoteDataManager: IssuesRemoteDataManagerInputProtocol {
    weak var remoteRequestHandler: IssuesRemoteDataManagerOutputProtocol?
    private let ownerStr: String = "phuongdateh"
    private let nameRepo: String = "GrapQL-Github-IOS"
    
    func getIssues() {
        let query = ListIssueQuery.init(owner: ownerStr, name: nameRepo, numberIssue: 100, states: [IssueState.open, IssueState.closed])
        apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, context: nil, queue: .main) { [weak self] (results) in
            switch results {
            case .success(let results):
                if let data = results.data {
                    if let data = try? JSONSerialization.data(withJSONObject: data.jsonObject, options: []) {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                                let repository = json["repository"] as? [String: Any],
                                let issues = repository["issues"] as? [String: Any],
                                let edges = issues["edges"] as? [[String: Any]] {
                                let realm = try! Realm()
                                let tpmList = realm.objects(IssueNodeModel.self)
                                var existId: [String] = []
                                realm.safeWrite {
                                    for edge in edges {
                                        let map = Map.init(mappingType: .fromJSON, JSON: edge)
                                        if let issueModel = IssueModel.init(map: map) {
                                            issueModel.mapping(map: map)
                                            if let node = issueModel.node {
                                                existId.append(node.id!)
                                                realm.add(node, update: .all)
                                            }
                                        }
                                    }
                                    let notExitsList = tpmList.filter(NSPredicate.init(format: "NOT (id IN %@)", existId))
                                    realm.delete(notExitsList)
                                }
                            }
                        }
                        catch let error {
                            print("error: \(error.localizedDescription)")
                        }
                    }
                    else {
                        print("json fail")
                    }
                }
                else {
                    print("pasre error")
                }
                if let weakSelf = self, let remoteRequestHandler = weakSelf.remoteRequestHandler {
                    remoteRequestHandler.getIssuesSuccess()
                    return
                }
            case .failure(let error):
                if let weakSelf = self, let remoteRequestHandler = weakSelf.remoteRequestHandler {
                    remoteRequestHandler.getIssuesFail(info: error)
                    return
                }
                print("error: \(error.localizedDescription)")
            }
        }

    }
}
