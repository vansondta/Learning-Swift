//
//  ViewController.swift
//  Stepper
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = myStepper.value
        valueLabel.text = "\(Int(value))"
        // Do any additional setup after loading the view.
    }

    @IBAction func changedStepper(_ sender: UIStepper) {
        let value = sender.value
        valueLabel.text = "\(Int(value))"
    }
    
}

