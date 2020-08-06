//
//  IssuesInteractor.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

class IssuesInteractor: IssuesInteractorInputProtocol {
    weak var presenter: IssuesInteractorOutputProtocol?
    var localDataManager: IssuesLocalDataManagerProtocol?
    var remoteDataManager: IssuesRemoteDataManagerInputProtocol?
    
    private var notificationToken: NotificationToken?
    
    func initIssues() {
        if let presenter = presenter, let localDataManager = localDataManager {
            presenter.didInitIssues(localDataManager.initIssues())
        }
    }
    
    func getIssues() {
        if let remote = remoteDataManager {
            remote.getIssues()
        }
    }
    
    func registerChange(of issues: IssueList) {
        notificationToken = issues.observe({ [weak self] (change) in
            if let weakSelf = self, let presenter = weakSelf.presenter {
                presenter.receiveChange(of: change)
            }
        })
    }
}

extension IssuesInteractor: IssuesRemoteDataManagerOutputProtocol {
    func getIssuesSuccess() {
        if let presenter = presenter {
            presenter.getIssuesSuccess()
        }
    }
    
    func getIssuesFail(info: Any?) {
        if let presenter = presenter {
            presenter.getIssuesFail()
        }
    }
}
