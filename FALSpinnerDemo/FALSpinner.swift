//
//  FALSpinner.swift
//  FALSpinnerDemo
//
//  Created by Matheus Falcão on 07/04/16.
//  Copyright © 2016 Falcão. All rights reserved.
//

import UIKit
import ObjectiveC
import Foundation

private var spinnerKey: UInt8 = 0

extension UIViewController {
    
    var spinner: FALSpinner {
        get {
            return associatedObject(self, key: &spinnerKey)
            { return FALSpinner() }
        }
        set { associateObject(self, key: &spinnerKey, value: newValue) }
    }
    
    func startLoading() {
        
        spinner.viewController = self
        
        spinner.startLoading()
        
    }
    
    func stopLoading() {
        
        spinner.viewController = self
        
        spinner.stopLoading()
        
    }
    
}

class FALSpinner {
    
    fileprivate var background: UIView!
    fileprivate var loaded: Bool! = false
    fileprivate var loader: UIActivityIndicatorView!
    
    var dark_alpha : CGFloat = 0.75
    var start_seconds_delay : Double = 1
    var stop_seconds_delay : Double = 0.5
    
    var fade : Bool = true
    
    var viewController : UIViewController!
    
    init() {
        
    }
    
    convenience init(thisViewController : UIViewController) {
        self.init()
        
        viewController = thisViewController
        
    }
    
    convenience init(thisViewController: UIViewController, dark_alpha: CGFloat, start_seconds_delay: Double, stop_seconds_delay: Double )
    {
        self.init(thisViewController: thisViewController)
        self.dark_alpha = dark_alpha
        self.start_seconds_delay = start_seconds_delay
        self.stop_seconds_delay = stop_seconds_delay
    }
    
    func componentInit() {
        
        let width = viewController.view.frame.width
        let height = viewController.view.frame.height
        
        loader = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0, width: width, height: height))
        loader.contentMode = UIViewContentMode.center
        loader.isHidden = true
        loader.hidesWhenStopped = true
        loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        
        background = UIView(frame: CGRect(x: 0,y: 0, width: width, height: height))
        background.backgroundColor = UIColor.black
        background.alpha = 0.75
        background.isHidden = true
        
    }
    
    func startLoading() {
        
        if background == nil {
            
            componentInit()
            
        }
        
        viewController.view.addSubview(background)
        viewController.view.addSubview(loader)
        
        loaded = true
        
        loader.isHidden = false
        background.isHidden = false
        
        if fade {
            
            background.alpha = 0
            
            UIView.animate(withDuration: start_seconds_delay, animations: {
                self.background.alpha = self.dark_alpha
            })
            
        }
        
        loader.startAnimating()
        
    }
    
    func stopLoading() {
        
        if (loaded == true){
            loader.isHidden = true
            
            if fade {
             
                UIView.animate(withDuration: stop_seconds_delay, animations: {
                    self.background.alpha = 0
                    }, completion: {
                        (value: Bool) in
                        self.background.isHidden = true
                        self.background.removeFromSuperview()
                })
                
            } else {
                
                self.background.isHidden = true
                self.background.removeFromSuperview()
                
            }
            
            loader.removeFromSuperview()
        }
        
        loaded = false
        
    }
    
    
}

func associatedObject<ValueType: AnyObject>(
    _ base: AnyObject,
    key: UnsafePointer<UInt8>,
    initialiser: () -> ValueType)
    -> ValueType {
        if let associated = objc_getAssociatedObject(base, key)
            as? ValueType { return associated }
        let associated = initialiser()
        objc_setAssociatedObject(base, key, associated,
                                 .OBJC_ASSOCIATION_RETAIN)
        return associated
}

func associateObject<ValueType: AnyObject>(
    _ base: AnyObject,
    key: UnsafePointer<UInt8>,
    value: ValueType) {
    objc_setAssociatedObject(base, key, value,
                             .OBJC_ASSOCIATION_RETAIN)
}
