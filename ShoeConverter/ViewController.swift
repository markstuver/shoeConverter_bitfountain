//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Mark Stuver on 9/16/14.
//  Copyright (c) 2014 Mark Stuver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mensShoeSizeTextField: UITextField!
    @IBOutlet weak var mensConvertedShoeSizeLabel: UILabel!
    
    @IBOutlet weak var womensShoeSizeTextField: UITextField!
    @IBOutlet weak var womensConvertShoeSizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 /// Button to convert US Shoe size to European size
    @IBAction func convertButtonPressed(sender: UIButton) {
        
        /* // create constant & set to the string value of the textField
        let sizeFromTextField = mensShoeSizeTextField.text
        
        // create constant & and create optional to convert the string into an Int
        let numberFromTextField = sizeFromTextField.toInt()
        
        // create variable and call the optional to set the variable to be equal to the Int value
        var integerFromTextField = numberFromTextField! */
        
// Refactor the above code into:
        let sizeFromTextField = mensShoeSizeTextField.text.toInt()!
        
        // create constant of the conversion rate that is used to calculate the conversion
        let conversionConstant = 30
        
        mensConvertedShoeSizeLabel.hidden = false
        
    /* // Using shorthand, set the integerFromTextField variable to equal the current value of the integerFromTextField plus the conversionConstant
        integerFromTextField += conversionConstant
        
        // create a string Interpolation using the value of the integerFromTextField constant
        let stringWithUpdatedShoeSize = "\(integerFromTextField)" + " in European Shoe Size" */
        
// Refactor the above code into:
        
        /* let stringWithUpdatedShoeSize = "\(sizeFromTextField + conversionConstant)" + " in European Shoe Size"
        
        // set the text property of the converted shoe size label equal to the stringWithUpdatedShoeSize constant
        mensConvertedShoeSizeLabel.text = stringWithUpdatedShoeSize */
        
// Refactor the above code into:
        
        mensConvertedShoeSizeLabel.text = "\(sizeFromTextField + conversionConstant)" + " in European Shoe Size"
        
        // release keyboard
        sender.resignFirstResponder()
        }
    
    @IBAction func convertWomensShoeSizeButtonPressed(sender: UIButton) {
        
        let sizeFromTextField = Double ((womensShoeSizeTextField.text as NSString).doubleValue)
        
        let conversionConstant = 30.5
        
        womensConvertShoeSizeLabel.hidden = false
        
        womensConvertShoeSizeLabel.text = "\(sizeFromTextField + conversionConstant)" + " in European Shoe Size"
        
    }
}

