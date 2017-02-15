//
//  FALSpinner.swift
//
//  Created by Matheus Falcão.
//

import UIKit
import ObjectiveC
import Foundation

private var spinnerKey: UInt8 = 0

extension UIViewController {
    
    var spinner: FALSpinner {
        get {
            return associatedObject(self, key: &spinnerKey)
            { return FALSpinner() } // Set the initial value of the var
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
    
    private var background: UIView!
    private var loaded: Bool! = false
    private var loader: UIActivityIndicatorView!
    
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
        
        loader = UIActivityIndicatorView(frame: CGRectMake(0,0, width, height))
        loader.contentMode = UIViewContentMode.Center
        loader.hidden = true
        loader.hidesWhenStopped = true
        loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        
        background = UIView(frame: CGRectMake(0,0, width, height))
        background.backgroundColor = UIColor.blackColor()
        background.alpha = 0.75
        background.hidden = true
        
    }
    
    func startLoading() {
        
        if background == nil {
            
            componentInit()
            
        }
        
        viewController.view.addSubview(background)
        viewController.view.addSubview(loader)
        
        loaded = true
        
        loader.hidden = false
        background.hidden = false
        
        if fade {
            
            background.alpha = 0
            
            UIView.animateWithDuration(start_seconds_delay, animations: {
                self.background.alpha = self.dark_alpha
            })
            
        }
        
        loader.startAnimating()
        
    }
    
    func stopLoading() {
        
        if (loaded == true){
            loader.hidden = true
            
            if fade {
             
                UIView.animateWithDuration(stop_seconds_delay, animations: {
                    self.background.alpha = 0
                    }, completion: {
                        (value: Bool) in
                        self.background.hidden = true
                        self.background.removeFromSuperview()
                })
                
            } else {
                
                self.background.hidden = true
                self.background.removeFromSuperview()
                
            }
            
            loader.removeFromSuperview()
        }
        
        loaded = false
        
    }
    
    
}

func associatedObject<ValueType: AnyObject>(
    base: AnyObject,
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
    base: AnyObject,
    key: UnsafePointer<UInt8>,
    value: ValueType) {
    objc_setAssociatedObject(base, key, value,
                             .OBJC_ASSOCIATION_RETAIN)
}
