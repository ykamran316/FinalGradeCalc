//
//  ViewController.swift
//  FinalGradeCalc
//
//  Created by Student on 10/22/20.
//  Copyright © 2020 ykamran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentGradeTextField: UITextField!
    @IBOutlet weak var finalWeightTextField: UITextField!
    @IBOutlet weak var requiredGradeTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onSegmentedControllerTapped(_ sender: UISegmentedControl) {
        let desiredGrade = 100.0 - ((Double(sender.selectedSegmentIndex) + 1.0) * 10.0)
        if let currentGrade = Double(currentGradeTextField.text!) {
            if let finalWeight = Double(finalWeightTextField.text!) {
                if finalWeight < 100 && finalWeight > 0 {
                    let finalPercentage = finalWeight / 100.0
                    let requiredGrade = max(0.0, (desiredGrade - (currentGrade * (1.0 - finalPercentage))) / finalPercentage)
                    requiredGradeTextField.text = String(format: "%.1f", requiredGrade)
                    if requiredGrade > 100 {
                        view.backgroundColor = .red
                    }
                    else {
                        view.backgroundColor = .green
                    }
                    view.endEditing(true)
                }
            }
        }
    }
    
    
}

