//
//  Network.swift
//  FrontPage
//
//  Created by DoanDuyPhuong on 8/3/20.
//  Copyright © 2020 Apollo GraphQL. All rights reserved.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
//    private let token: String = "e1cffd92246b6b78a93aebbfc4d2ef720fef71c3"  exprice
    

    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "https://api.github.com/graphql")!)
        transport.delegate = self
        return transport
    }()

    private(set) lazy var apollo = ApolloClient.init(networkTransport: self.networkTransport)
}

extension Network: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        // If there's an authenticated user, send the request. If not, don't.
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        // Get the existing headers, or create new ones if they're nil
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        // Add any new headers you need
        headers["Authorization"] = "bearer \(token)"
        // Re-assign the updated headers to the request.
        request.allHTTPHeaderFields = headers
        print("Outgoing request: \(request)")
    }
}
