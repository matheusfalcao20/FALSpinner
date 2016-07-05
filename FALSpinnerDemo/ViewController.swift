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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

