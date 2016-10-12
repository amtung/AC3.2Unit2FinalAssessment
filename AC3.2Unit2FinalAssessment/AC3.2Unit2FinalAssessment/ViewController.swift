//
//  DetailViewController.swift
//  AC3.2Unit2FinalAssessment
//
//  Created by Annie Tung on 10/6/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sliderBar: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self //delegate
        
    }


    @IBAction func sliderChanged(_ sender: UISlider) { //target-action
        sender.maximumValue = 50
        sender.minimumValue = 0
        sender.isContinuous = true;
        stepper.value = Double(sender.value)
        textField.text = String(sender.value)
        label.text = String(sender.value)
    }


    @IBAction func stepperTapped(_ sender: UIStepper) { //target-action
        sliderBar.value = Float(sender.value)
        textField.text = String(sender.value)
        label.text = String(sender.value)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, let float = Float(text), let double = Double(text) { //delegate method
            stepper.value = double
            sliderBar.value = float
            label.text = text
        }
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let tappedVC: 
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */
    

}
