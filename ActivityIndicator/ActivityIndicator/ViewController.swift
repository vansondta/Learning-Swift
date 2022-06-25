//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startActivityAction(_ sender: Any) {
        myActivity.startAnimating()
        myActivity.hidesWhenStopped = false
    }
    
    @IBAction func stopActivityAction(_ sender: Any) {
        myActivity.stopAnimating()
        myActivity.hidesWhenStopped = true
    }
    
}

