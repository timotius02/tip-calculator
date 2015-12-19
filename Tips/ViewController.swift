//
//  ViewController.swift
//  Tips
//
//  Created by Timotius Sitorus on 12/17/15.
//  Copyright © 2015 Timotius Sitorus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet weak var percent1: UIView!
    @IBOutlet weak var percent2: UIView!
    @IBOutlet weak var percent3: UIView!
    @IBOutlet weak var percent4: UIView!
    @IBOutlet weak var percent5: UIView!
    
    @IBOutlet weak var percentText1: UILabel!
    @IBOutlet weak var percentText2: UILabel!
    @IBOutlet weak var percentText3: UILabel!
    @IBOutlet weak var percentText4: UILabel!
    @IBOutlet weak var percentText5: UILabel!
    
    var tipPercentage = 0.15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"

        let plusLabel = UILabel()
        plusLabel.text = "$ "
        plusLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        plusLabel.sizeToFit()
        
        
        plusLabel.textColor = UIColor.whiteColor()
        billField.leftView = plusLabel
        billField.leftViewMode = UITextFieldViewMode.Always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let billAmount = (billField.text! as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        totalLabel.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func switchPercentage(sender: UITapGestureRecognizer) {
        percent1.backgroundColor = UIColor.whiteColor()
        percent2.backgroundColor = UIColor.whiteColor()
        percent3.backgroundColor = UIColor.whiteColor()
        percent4.backgroundColor = UIColor.whiteColor()
        percent5.backgroundColor = UIColor.whiteColor()
        
        percentText1.textColor = UIColor.blackColor()
        percentText2.textColor = UIColor.blackColor()
        percentText3.textColor = UIColor.blackColor()
        percentText4.textColor = UIColor.blackColor()
        percentText5.textColor = UIColor.blackColor()
        
        sender.view?.layer.backgroundColor = UIColor.blackColor().CGColor
        
        switch sender.view {
        case percent1?:
            percentText1.textColor = UIColor.whiteColor()
            tipPercentage = 0.15
        case percent2?:
            percentText2.textColor = UIColor.whiteColor()
            tipPercentage = 0.17
        case percent3?:
            percentText3.textColor = UIColor.whiteColor()
            tipPercentage = 0.2
        case percent4?:
            percentText4.textColor = UIColor.whiteColor()
            tipPercentage = 0.22
        case percent5?:
            percentText5.textColor = UIColor.whiteColor()
            customPercentage()
        default:
            print("Error!")
        }
        
        onEditingChanged("switchPercentage")
    }
    
    
    func customPercentage() {
        var inputTextField: UITextField?
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Tip Percentage", message: "Enter the Percent (0 to 100) you want to give as tip", preferredStyle: .Alert)
        
        //Add a text field
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            textField.textColor = UIColor.blackColor()
            textField.keyboardType = UIKeyboardType.DecimalPad
            inputTextField = textField
            
        }
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
        }
        let nextAction: UIAlertAction = UIAlertAction(title: "Next", style: .Default) { action -> Void in
            if let customPercent = inputTextField?.text! {
                let doublePercent = (customPercent as NSString).doubleValue / 100
                if doublePercent <= 1 && doublePercent >= 0 {
                    self.tipPercentage = doublePercent
                    self.percentText5.text = customPercent + "%"
                    self.onEditingChanged("customPercentage")
                }
                else {
                    let alert = UIAlertView()
                    alert.title = "Invalid Tip Percentage"
                    alert.addButtonWithTitle("OK")
                    alert.show()
                }
            }
            else {
                let alert = UIAlertView()
                alert.title = "Invalid Tip Percentage"
                alert.addButtonWithTitle("OK")
                alert.show()
            }
        }
        
        actionSheetController.addAction(cancelAction)
        actionSheetController.addAction(nextAction)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
}

