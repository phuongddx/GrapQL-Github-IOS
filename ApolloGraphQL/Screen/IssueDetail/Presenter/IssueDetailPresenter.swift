//
//  IssueDetailPresenter.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

class IssueDetailPresenter: IssueDetailPresenterProtocol {
    weak var view: IssueDetailViewProtocol?
    var wireFrame: IssueDetailWireFrameProtocol?
    
    var issue: IssueNodeModel?

    func viewDidload() {
        
    }
}
