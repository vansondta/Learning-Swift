//
//  ViewController.swift
//  SwitchExample
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn == true {
            contentImageView.image = UIImage(named: "on")
        } else {
            contentImageView.image = UIImage(named: "off")
        }
    }
}

