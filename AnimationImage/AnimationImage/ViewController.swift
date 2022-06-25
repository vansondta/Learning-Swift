//
//  ViewController.swift
//  AnimationImage
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderAction(_ sender: UISlider) {
        let index = sender.value
        let value = Int(index)
        imageView.image = UIImage(named: "\(value)")
    }
    
}

