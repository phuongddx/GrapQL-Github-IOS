//
//  UIView.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addChildView(_ childView: UIView,
                      top: CGFloat = 0,
                      bottom: CGFloat = 0,
                      trailing: CGFloat = 0,
                      leading: CGFloat = 0) {
        addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        let constraints: [NSLayoutConstraint] = [childView.alignTop(to: self, space: top),
                                                 childView.alignBottom(to: self, space: bottom),
                                                 childView.alignLeading(to: self, space: leading),
                                                 childView.alignTrailing(to: self, space: trailing)
        ]
        addConstraints(constraints)
    }
    // align trailing to destinationView
    func alignTrailing(to destinationView: UIView ,
                  relation: NSLayoutConstraint.Relation = .equal,
                  multiplier: CGFloat = 1,
                  space: CGFloat = 0,
                  priority: Float = 1000) -> NSLayoutConstraint  {
        let constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: self,
                                                                     attribute: .trailing,
                                                                     relatedBy: relation,
                                                                     toItem: destinationView,
                                                                     attribute: .trailing,
                                                                     multiplier: 1,
                                                                     constant: space)
        constraint.priority = UILayoutPriority.init(priority)
        return constraint
        
    }
    // align leading to destinationView
    func alignLeading(to destinationView: UIView ,
                  relation: NSLayoutConstraint.Relation = .equal,
                  multiplier: CGFloat = 1,
                  space: CGFloat = 0,
                  priority: Float = 1000) -> NSLayoutConstraint  {
        let constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: self,
                                                                     attribute: .leading,
                                                                     relatedBy: relation,
                                                                     toItem: destinationView,
                                                                     attribute: .leading,
                                                                     multiplier: 1,
                                                                     constant: space)
        constraint.priority = UILayoutPriority.init(priority)
        return constraint
    }
    
    // align top to destinationView
    func alignTop(to destinationView: UIView ,
                  relation: NSLayoutConstraint.Relation = .equal,
                  multiplier: CGFloat = 1,
                  space: CGFloat = 0,
                  priority: Float = 1000) -> NSLayoutConstraint  {
        let constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: self,
                                                                     attribute: .top,
                                                                     relatedBy: relation,
                                                                     toItem: destinationView,
                                                                     attribute: .top,
                                                                     multiplier: 1,
                                                                     constant: space)
        constraint.priority = UILayoutPriority.init(priority)
        return constraint
        
    }
    // align bottom to destinationView
    func alignBottom(to destinationView: UIView ,
                  relation: NSLayoutConstraint.Relation = .equal,
                  multiplier: CGFloat = 1,
                  space: CGFloat = 0,
                  priority: Float = 1000) -> NSLayoutConstraint  {
        let constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: self,
                                                                     attribute: .bottom,
                                                                     relatedBy: relation,
                                                                     toItem: destinationView,
                                                                     attribute: .bottom,
                                                                     multiplier: 1,
                                                                     constant: space)
        constraint.priority = UILayoutPriority.init(priority)
        return constraint
    }
}
