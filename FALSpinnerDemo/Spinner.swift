//
//  FlyChatSpinner.swift
//  FlyChat
//
//  Created by Matheus Falcão on 04/06/16.
//  Copyright © 2016 Propa. All rights reserved.
//

import UIKit

class Spinner {
    
    var background: UIView!
    var loaded: Bool! = false
    var loader: UIActivityIndicatorView!
    
    var dark_alpha : CGFloat = 0.75
    var start_seconds_delay : Double = 1
    var stop_seconds_delay : Double = 0.5
    
    var viewController : UIViewController!
    
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
        background.hidden = true
        
    }
    
    convenience init(thisViewController: UIViewController, dark_alpha: CGFloat, start_seconds_delay: Double, stop_seconds_delay: Double )
    {
        self.init(thisViewController: thisViewController)
        self.dark_alpha = dark_alpha
        self.start_seconds_delay = start_seconds_delay
        self.stop_seconds_delay = stop_seconds_delay
    }
    
    func startLoading() {
        
        viewController.view.addSubview(background)
        viewController.view.addSubview(loader)
        
        loaded = true
        
        loader.hidden = false
        background.hidden = false
        
        background.alpha = 0
        UIView.animateWithDuration(start_seconds_delay, animations: {
            self.background.alpha = self.dark_alpha
        })
        
        loader.startAnimating()
        
    }
    
    func stopLoading() {
        
        if (loaded == true){
            
            background.alpha = self.dark_alpha
            
            self.loader.hidden = true
            self.loader.removeFromSuperview()
            
            UIView.animateWithDuration(stop_seconds_delay, animations: {
                self.background.alpha = 0
                }, completion: {
                    (value: Bool) in
                    self.background.hidden = true
                    self.background.removeFromSuperview()
            })
            
            loaded = false
        }
        
    }
    
}
