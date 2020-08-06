//
//  IssueDetailWireFrame.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

class IssueDetailWireFrame: IssueDetailWireFrameProtocol {
    static func createIssueDetailViewController(_ issue: IssueNodeModel) -> IssueDetailViewController? {
        if let vc = Utils.viewController(IssueDetailViewController.storyBoardId, storyboardName: IssueDetailViewController.storyBoardName) as? IssueDetailViewController {
            return vc
        }
        return nil
    }
}
