//
//  LoginViewController.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/5/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    static let storyBoardName: String = "Login"
    static let storyBoardId: String = "LoginViewController"
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func pushIssuesViewController() {
        if let issueVC = IssuesWireFrame.createIssuesViewController() {
            navigationController?.pushViewController(issueVC, animated: true)
        }
    }
    
    @IBAction func login_TouchUpInside(_ sender: Any) {
        pushIssuesViewController()
    }
}
