//
//  ViewController.swift
//  Segmentcontrol
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        print(index)
        switch index {
        case 0:
            print("segment 0 is selected")
        case 1:
            print("segment 1 is selected")
        case 2:
            print("segment 2 is selected")
        case 3:
            print("segment 3 is selected")
        default:
            print("defult is selected")
        }
    }
    
}

