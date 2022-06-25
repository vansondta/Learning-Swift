//
//  ViewController.swift
//  TapGesture
//
//  Created by TheLightLove on 25/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var foodImageView: UIImageView!
    var isBool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapGestureClick(_ sender: Any) {
        if isBool {
            foodImageView.image = UIImage(named: "Echchiensa")
        } else {
            foodImageView.image = UIImage(named: "Doitruongxaothapcam")
        }
        isBool = !isBool
    }
    

}

