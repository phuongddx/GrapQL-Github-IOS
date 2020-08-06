//
//  IssueDetailInteractor.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

class IssueDetailInteractor: IssueDetailInteractorInputProtocol {
    weak var presenter: IssueDetailInteractorOutputProtocol?
    var localDataManager: IssueDetailLocalDataManagerProtocol?
    
    func initIssueNode(with id: String) {
        if let presenter = presenter, let local = localDataManager {
            presenter.didInitIssueNode(local.initIssueNode(with: id))
        }
    }
    
    func getIssueNode(numberIssue: Int) {
        
    }
    
    var notificationToken: NotificationToken?
    
    func registerChange(of issueNode: IssueNodeModel) {
        notificationToken = issueNode.observe({[weak self] (change: ObjectChange<IssueNodeModel>) in
            if let weakSelf = self, let presenter = weakSelf.presenter {
                presenter.receiveChange(change)
            }
        })
    }
}
