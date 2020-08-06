//
//  IssuesWireFrame.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

class IssuesWireFrame: IssuesWireFrameProtocol {
    static func createIssuesViewController() -> IssuesViewController? {
        if let vc = Utils.viewController(IssuesViewController.storyBoardId, storyboardName: IssuesViewController.storyBoardName) as? IssuesViewController {
            let presenter = IssuesPresenter()
            let wireFrame = IssuesWireFrame()
            let interactor = IssuesInteractor()
            let remoteDataManager = IssuesRemoteDataManager()
            let localDataManager = IssuesLocalDataManager()
            
            vc.presenter = presenter
            presenter.interactor = interactor
            presenter.view = vc
            presenter.wireFrame = wireFrame
            interactor.presenter = presenter
            interactor.remoteDataManager = remoteDataManager
            interactor.localDataManager = localDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return vc
        }
        return nil
    }
}
