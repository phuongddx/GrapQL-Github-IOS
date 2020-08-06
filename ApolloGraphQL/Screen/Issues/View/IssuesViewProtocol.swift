//
//  IssuesViewProtocol.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation

protocol IssuesViewProtocol: class {
    var presenter: IssuesPresenterProtocol? { get set }
    
    func updateView()
    func beginLoading()
    func endLoading()
}
