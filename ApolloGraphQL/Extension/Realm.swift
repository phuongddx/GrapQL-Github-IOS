//
//  Realm.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/6/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) {
        if isInWriteTransaction == true {
            try! block()
        } else {
            try! write(block)
        }
    }
}
