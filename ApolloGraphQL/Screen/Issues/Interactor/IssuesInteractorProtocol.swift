//
//  IssuesInteractorProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

typealias IssueList = Results<IssueNodeModel>

protocol IssuesInteractorInputProtocol: class {
    var presenter: IssuesInteractorOutputProtocol? { get set }
    var localDataManager: IssuesLocalDataManagerProtocol? { get set }
    var remoteDataManager: IssuesRemoteDataManagerInputProtocol? { get set }
    
    func initIssues()
    func getIssues()
    func registerChange(of issues: IssueList)
}

protocol IssuesInteractorOutputProtocol: class {
    func didInitIssues(_ issues: Results<IssueNodeModel>)
    func getIssuesSuccess()
    func getIssuesFail()
    func receiveChange(of change: RealmCollectionChange<IssueList>)
}
