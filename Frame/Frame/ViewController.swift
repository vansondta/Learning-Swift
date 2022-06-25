//
//  ViewController.swift
//  Frame
//
//  Created by TheLightLove on 25/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var foodImge: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
//        imageView.image = UIImage(named: "Echchiensa")
//        self.view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func upAction(_ sender: Any) {
        let y = foodImge.frame.origin.y
        foodImge.frame.origin.y = y - 10
    }
    
    @IBAction func leftAction(_ sender: Any) {
        let x = foodImge.frame.origin.x
        foodImge.frame.origin.x = x - 10
    }
    
    @IBAction func rightAction(_ sender: Any) {
        let x = foodImge.frame.origin.x
        foodImge.frame.origin.x = x + 10
    }
    
    @IBAction func downAction(_ sender: Any) {
        let y = foodImge.frame.origin.y
        foodImge.frame.origin.y = y + 10
    }
}

