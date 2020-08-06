//
//  IssueDetailLocalDataManagerProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

protocol IssueDetailLocalDataManagerProtocol: class {
    func initIssueNode(with id: String) -> IssueNodeModel?
}
