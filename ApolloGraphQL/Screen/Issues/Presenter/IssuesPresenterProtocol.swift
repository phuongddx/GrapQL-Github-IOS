//
//  IssuesPresenterProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

protocol IssuesPresenterProtocol: class {
    var view: IssuesViewProtocol? { get set }
    var wireFrame: IssuesWireFrameProtocol? { get set }
    var interactor: IssuesInteractorInputProtocol? { get set }
    
    var issueList: Results<IssueNodeModel>! { get set }
    
    func viewDidLoad()
    func pushIssueDetail(issueId: String)
}
