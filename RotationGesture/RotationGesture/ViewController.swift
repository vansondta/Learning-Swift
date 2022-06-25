//
//  ViewController.swift
//  RotationGesture
//
//  Created by TheLightLove on 25/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var lastRotation: CGFloat = 0
    
    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        var originalRotation = CGFloat()
        if sender.state == .began {
            /// bắt đầu xoay
            print("began")
            sender.rotation = lastRotation
            originalRotation = sender.rotation
        } else if sender.state == .changed {
            /// xoay ảnh
            print("changed")
            let newRotation = sender.rotation + originalRotation
            sender.view?.transform = CGAffineTransform(rotationAngle: newRotation)
        } else if sender.state == .ended {
            /// ngưng xoay
            print("ended ")
            lastRotation = sender.rotation
        }
    }
    
}

