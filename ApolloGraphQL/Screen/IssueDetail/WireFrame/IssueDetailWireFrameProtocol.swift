//
//  IssueDetailWireFrameProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

protocol IssueDetailWireFrameProtocol: class {
    static func createIssueDetailViewController(_ issue: IssueNodeModel) -> IssueDetailViewController?
}
