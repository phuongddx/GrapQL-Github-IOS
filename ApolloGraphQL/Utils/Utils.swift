//
//  Utils.swift
//  ApolloGraphQL
//
//  Created by DoanDuyPhuong on 8/5/20.
//  Copyright © 2020 prox.com. All rights reserved.
//

import Foundation
import UIKit

public final class Utils {
    
    class func screenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    class func viewController(_ storyboardId: String, storyboardName: String) -> UIViewController? {
        let storyboard = storyboardBoardWithName(storyboardName)
        let viewController: AnyObject = storyboard.instantiateViewController(withIdentifier: storyboardId)
        return viewController as? UIViewController
    }
    
    class func storyboardBoardWithName(_ storyboardName: String) -> UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard
    }
    
    class func viewFrom(_ nibName: String) -> UIView? {
        let objects = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        if objects!.count > 0 {
            return objects![0] as? UIView
        }
        return nil
    }
}
