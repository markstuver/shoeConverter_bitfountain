//
//  MensConvertViewController.swift
//  ShoeConverter
//
//  Created by Mark Stuver on 9/17/14.
//  Copyright (c) 2014 Mark Stuver. All rights reserved.
//

import UIKit

class MensConvertViewController: UIViewController {

    var conversionToUS:Bool = true
    
    @IBOutlet weak var mensShoeSizeTextField: UITextField!
    @IBOutlet weak var mensConvertedShoeSizeLabel: UILabel!
    
    @IBOutlet weak var convertToUSButtonLabel: UIButton!
    @IBOutlet weak var convertToEUButtonLabel: UIButton!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reset textfield's placeholder text to European
        mensShoeSizeTextField.placeholder = "Enter US Shoe Size Here"
        
        // Reset convert to US label to gray
        convertToUSButtonLabel.titleLabel?.textColor = UIColor.blueColor()
        
        // Reset convert to EU label to blue
        convertToEUButtonLabel.titleLabel?.textColor = UIColor.grayColor()
        
        
        }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - IBAction Button Methods

    /// Button to convert US Shoe size to European size
    @IBAction func convertButtonPressed(sender: UIButton) {
        
        // Get the value entered into the shoe size text field
        let valueFromTextField:Double = ((mensShoeSizeTextField.text as NSString).doubleValue)
        
        determineTypeOfConversion(valueFromTextField, conversionToUS: conversionToUS)
        
        sender.resignFirstResponder()
    }
    
    
// Convert to US button Action
    @IBAction func convertToUsButtonPressed(sender: UIButton) {
        
        conversionToUS = true
        
        // Convert to US label to blue
        convertToUSButtonLabel.titleLabel?.textColor = UIColor.blueColor()
        
        // Convert to EU label to gray
        convertToEUButtonLabel.titleLabel?.textColor = UIColor.grayColor()
        
        // Text field placeholder
        mensShoeSizeTextField.placeholder = "Enter European Shoe Size Here"
    }

    
// Convert to EU Button Action
    @IBAction func convertToEUButtonPressed(sender: UIButton) {
        
        conversionToUS = false
        
        // Convert to EU label to blue
        convertToEUButtonLabel.titleLabel?.textColor = UIColor.blueColor()
        
        // Convert to US label to gray
        convertToUSButtonLabel.titleLabel?.textColor = UIColor.grayColor()
        
        // Text field placeholder
        mensShoeSizeTextField.placeholder = "Enter US Shoe Size Here"
    }
    
    
    
    
    
    
    
    

    //MARK: - Helper Methods
    
    func determineTypeOfConversion(valueOfTextField:Double, conversionToUS:Bool) {
        
        let conversionConstant:Double = 30
        
        /// IF the ConvertToUS is true and the value of the text field is a number
        if conversionToUS == true && valueOfTextField != 0.0 {
            
            mensConvertedShoeSizeLabel.hidden = false
            
            mensConvertedShoeSizeLabel.text = "European Shoe Size " + "\(valueOfTextField)" + "\n" +
                    "is equal to US Shoe Size: " + "\(valueOfTextField - conversionConstant)"
        
        /// ELSE IF the convertToUS is false and the value of the text field is a number
        } else if conversionToUS != true && valueOfTextField != 0.0 {
            
            mensConvertedShoeSizeLabel.hidden = false
            
            mensConvertedShoeSizeLabel.text = "US Shoe Size " + "\(valueOfTextField)" + "\n" +
                "is equal to European Shoe Size: " + "\(valueOfTextField - conversionConstant)"
            
        // Else... Show Alert To Inform User of the Error
        } else {
                
                // Create constant and set as an Alert Controller (add title, message and preferredStyle)
                let alert = UIAlertController (title: "Alert! An Error Has Occurred", message: "When entering the shoe size to be converted, please only use numbers.", preferredStyle: UIAlertControllerStyle.Alert)
                
                // Create constant and set as the Alert Action that will determine what action will be done from the options given when the alert controller appears
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                // Add the Alert Action to the Alert Controller
                alert.addAction(defaultAction)
                
                // Show the alert above the current view
                presentViewController(alert, animated: true, completion: nil)
            }
        
        
        }
    
    
    
    
    
}
