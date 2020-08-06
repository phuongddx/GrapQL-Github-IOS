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
    var interactor: IssueDetailInteractorInputProtocol? { get set }
    
    var issueId: String! { get set }
    var issueNode: IssueNodeModel? { get set }

    func viewDidload()
}
