//
//  IssuesRemoteDataManagerProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

protocol IssuesRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: IssuesRemoteDataManagerOutputProtocol? { get set }
    
    func getIssues()
}

protocol IssuesRemoteDataManagerOutputProtocol: class {
    func getIssuesSuccess()
    func getIssuesFail(info: Any?)
}
