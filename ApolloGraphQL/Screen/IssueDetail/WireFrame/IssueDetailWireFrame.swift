//
//  IssueDetailWireFrame.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

class IssueDetailWireFrame: IssueDetailWireFrameProtocol {
    static func createIssueDetailViewController(_ issueId: String) -> IssueDetailViewController? {
        if let vc = Utils.viewController(IssueDetailViewController.storyBoardId, storyboardName: IssueDetailViewController.storyBoardName) as? IssueDetailViewController {
            let presenter = IssueDetailPresenter()
            let interactor = IssueDetailInteractor()
            let wireFrame = IssueDetailWireFrame()
            let localDataManger = IssueDetailLocalDataManager()
            
            vc.presenter = presenter
            presenter.issueId = issueId
            presenter.view = vc
            presenter.interactor = interactor
            interactor.presenter = presenter
            presenter.wireFrame = wireFrame
            interactor.localDataManager = localDataManger
            
            return vc
        }
        return nil
    }
}
