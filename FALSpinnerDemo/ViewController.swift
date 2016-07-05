//
//  ViewController.swift
//  FALSpinnerDemo
//
//  Created by Matheus Falcão on 05/07/16.
//  Copyright © 2016 NOCLAF TECH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var spinner : FALSpinner!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        spinner = FALSpinner(thisViewController: self)
        
        spinner.startLoading()
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(ViewController.stopSpinner), userInfo: nil, repeats: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func stopSpinner() {
        
        spinner.stopLoading()
        
    }
    
}

