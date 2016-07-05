# FALSpinner
Simple Spinner write in Swift

## Example

  In a hurry? Try out our [iOS Demo project]: FALSpinnerDemo in this repository.

## Installation

 Copy the file "FALSpinner.swift" inside your project.
 
## Code
 
 To use is very simple, this is a example:
 
```
    
import UIKit

class ViewController: UIViewController {
    
    var spinner : FALSpinner!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        spinner = FALSpinner(thisViewController: self)
        
        spinner.startLoading()
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(ViewController.stopSpinner), userInfo: nil, repeats: false)
        
    }

    func stopSpinner() {
        
        spinner.stopLoading()
        
    }
    
}

```
    
    


 
 
