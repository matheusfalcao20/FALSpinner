//
//  DocPadSpinner.swift
//  DocPad
//
//  Created by Matheus Falcão on 07/04/16.
//  Copyright © 2016 Falcão. All rights reserved.
//

import UIKit

class FALSpinner {
    
    private var background: UIView!
    private var loaded: Bool! = false
    private var loader: UIActivityIndicatorView!
    private var viewController : UIViewController!
    
    init(thisViewController : UIViewController) {
        
        viewController = thisViewController
        
        let rect: CGRect = CGRectMake(0,0, viewController.view.frame.width, viewController.view.frame.height)
        loader = UIActivityIndicatorView(frame: rect)
        loader.contentMode = UIViewContentMode.Center
        loader.hidden = true
        loader.hidesWhenStopped = true
        loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        
        background = UIView(frame: CGRectMake(0,0, viewController.view.frame.width, viewController.view.frame.height))
        background.backgroundColor = UIColor.blackColor()
        background.alpha = 0.75
        background.hidden = true
        
    }
    
    func startLoading() {
        
        viewController.view.addSubview(background)
        viewController.view.addSubview(loader)
        
        loaded = true
        
        loader.hidden = false
        background.hidden = false
        
        loader.startAnimating()
        
    }
    
    func stopLoading() {
        
        if (loaded == true){
            background.hidden = true
            loader.hidden = true
            
            background.removeFromSuperview()
            loader.removeFromSuperview()
        }
        
        loaded = false
        
    }
    
    
}