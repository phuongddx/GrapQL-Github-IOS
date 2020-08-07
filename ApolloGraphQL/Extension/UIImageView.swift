//
//  UIImageView.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/7/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    func isCircleRadius() {
        layer.masksToBounds = true
        layer.cornerRadius = self.frame.width / 2
    }
    func downloadImage(from urlStr: String, placeHolder: String? = nil, isBlur: Bool = false) {
        if let placeholder = placeHolder {
            let placeholderImage = UIImage.init(named: placeholder)
            if let url = URL.init(string: urlStr) {
                if isBlur == false {
                    kf.setImage(with: url, placeholder: placeholderImage)
                }
                else {
                    let processor = BlurImageProcessor.init(blurRadius: 6)
                    kf.setImage(with: url, placeholder: placeholderImage, options: [.processor(processor)])
                }
                
            }
            else {
                image = UIImage.init(named: placeholder)
    
            }
        }
        else {
            if let url = URL.init(string: urlStr) {
                if isBlur == false {
                    kf.setImage(with: url)
                }
                else {
                    let processor = BlurImageProcessor.init(blurRadius: 6)
                    kf.setImage(with: url, placeholder: nil, options: [.processor(processor)])
                }
                
            }
            else {
                image = nil
            }
        }
    }
}
