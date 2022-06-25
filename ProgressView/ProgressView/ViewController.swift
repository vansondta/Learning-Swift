//
//  ViewController.swift
//  ProgressView
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.myProgressView.progress += 0.1
        }
        // Do any additional setup after loading the view.
    }


}

