//
//  ViewController.swift
//  SiderViewExample
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        print(sender.value)
    }
    
}

