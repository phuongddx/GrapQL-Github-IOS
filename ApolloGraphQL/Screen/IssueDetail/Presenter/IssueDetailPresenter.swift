//
//  IssueDetailPresenter.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

class IssueDetailPresenter: IssueDetailPresenterProtocol {
    weak var view: IssueDetailViewProtocol?
    var wireFrame: IssueDetailWireFrameProtocol?
    var interactor: IssueDetailInteractorInputProtocol?
    
    var issueId: String!
    var issueNode: IssueNodeModel?

    func viewDidload() {
        if let issueId = issueId, issueId.count > 0 {
            if let interactor = interactor {
                interactor.initIssueNode(with: issueId)
            }
        }
    }
}

extension IssueDetailPresenter: IssueDetailInteractorOutputProtocol {
    func didInitIssueNode(_ issueNode: IssueNodeModel?) {
        self.issueNode = issueNode
        if let issueNode = self.issueNode, let interactor = interactor {
            interactor.registerChange(of: issueNode)
        }
        if let view = view {
            view.updateView()
        }
    }
    
    func receiveChange(_ change: ObjectChange<IssueNodeModel>) {
        if let view = view {
            view.updateView()
        }
    }
}
