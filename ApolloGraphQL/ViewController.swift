//
//  ViewController.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/3/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTf: UITextField!
    @IBAction func searchBtn(_ sender: Any) {
        
        
        loadData(query: searchTf.text!)
        find()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func find() {
        apollo.fetch(query: GetUsernameQuery(), cachePolicy: .fetchIgnoringCacheData, context: nil, queue: .main) { (results) in
            switch results {
            case .success(let results):
                print("username: \(results.data?.viewer.login)")
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
            
        }
    }
    
    func loadData(query: String) {
        apollo.fetch(query: SearchRepositoriesQuery(query: query, count: 10), cachePolicy: .fetchIgnoringCacheData, context: nil, queue: .main) { [weak self] (result) in
            switch result {
            case .success(let result):
                result.data?.search.edges?.forEach { edge in
                    guard let repository = edge?.node?.asRepository?.fragments.repositoryDetails else { return }
                    print("Name: \(repository.name)")
                    print("Path: \(repository.url)")
                    print("Owner: \(repository.owner.resourcePath)")
                    print("Stars: \(repository.stargazers.totalCount)")
                    print("\n")
                }
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}

extension ViewController: HTTPNetworkTransportDelegate {
    
}

