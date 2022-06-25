//
//  ViewController.swift
//  PinchGestuer
//
//  Created by TheLightLove on 25/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func handleGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1.0
        }
    }
    
}

