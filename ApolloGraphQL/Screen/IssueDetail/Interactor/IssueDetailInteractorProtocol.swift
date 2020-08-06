//
//  IssueDetailInteractorProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

protocol IssueDetailInteractorInputProtocol: class {
    var presenter: IssueDetailInteractorOutputProtocol? { get set }
    var localDataManager: IssueDetailLocalDataManagerProtocol? { get set }
//    var remoteDataManager: IssueDetailRemoteDataManagerInputProtocol? { get set }
    
    func initIssueNode(with id: String)
    func registerChange(of issueNode: IssueNodeModel)
    func getIssueNode(numberIssue: Int)
}

protocol IssueDetailInteractorOutputProtocol: class {
    func didInitIssueNode(_ issueNode: IssueNodeModel?)
    func receiveChange(_ change: ObjectChange<IssueNodeModel>)
}
