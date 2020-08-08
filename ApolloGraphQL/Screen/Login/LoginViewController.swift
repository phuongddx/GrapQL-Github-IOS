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
    
    @IBOutlet weak var personalAccessTokenTf: UITextField!
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
        if let text = personalAccessTokenTf.text, text.isEmpty == false {
            tokenGit.setToken(token: text)
            login {[weak self] (isSuccess, error) in
                if isSuccess {
                    if let wealSelf = self {
                        wealSelf.pushIssuesViewController()
                    }
                }
                else {
                    if let weakSelf = self {
                        if let error = error {
                            let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            weakSelf.present(alert, animated: true) {
                                
                            }
                        }
                    }
                }
            }
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please anter personal token", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true) {
                
            }
        }
    }
    
    func login(completion: ((Bool, Error?) -> ())?) {
        
        apollo.fetch(query: GetUsernameQuery(), cachePolicy: .fetchIgnoringCacheData, context: nil, queue: .main) { (results) in
            switch results {
            case .success(let results):
                print(results)
                if let completion = completion {
                    completion(true, nil)
                }
            case .failure(let error):
                print(error)
                if let completion = completion {
                    completion(false, error)
                }
            }
        }
    }
}
