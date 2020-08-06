//
//  IssueDetailPresenterProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

protocol IssueDetailPresenterProtocol: class {
    var view: IssueDetailViewProtocol? { get set }
    var wireFrame: IssueDetailWireFrameProtocol? { get set }
    
    var issue: IssueNodeModel? { get set }

    func viewDidload()
}
