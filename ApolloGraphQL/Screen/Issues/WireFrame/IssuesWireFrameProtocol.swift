//
//  IssuesWireFrameProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

protocol IssuesWireFrameProtocol: class {
    static func createIssuesViewController() -> IssuesViewController?
    func pushIssueDetail(_ issueId: String, from view: IssuesViewProtocol)
}
