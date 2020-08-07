//
//  UILabel.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func heightOfLabel() -> CGFloat {
        let textSize = CGSize.init(width: frame.size.width, height: CGFloat(MAXFLOAT))
        return sizeThatFits(textSize).height
    }
    
    func widthOfLabel() -> CGFloat {
        let textSize = CGSize.init(width: CGFloat(MAXFLOAT), height: 10)
        return sizeThatFits(textSize).width
    }
}
