# FALSpinner
Simple Spinner write in Swift

## Example

  In a hurry? Try out our FALSpinnerDemo in this repository.

## Installation

 Copy the file "FALSpinner.swift" inside your project.
 
## Code
 
 To use is very simple, this is a example:
 
```swift
    
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        startLoading()
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.stopSpinner), userInfo: nil, repeats: false)
        
    }

    func stopSpinner() {
        
        stopLoading()
        
    }
    
}


```
    
    


 
 
