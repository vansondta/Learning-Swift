//
//  ViewController.swift
//  UIImageView
//
//  Created by TheLightLove on 23/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loadLoadCalAction(_ sender: Any) {
        imageView.image = UIImage(named: "image")
    }
    
    @IBAction func loadUrlAction(_ sender: Any) {
        /// get url
        let urlString = "https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/02/04060919/ios-swift.png"
        
        /// url
        let url = URL(string: urlString)
        
        /// get data from url
        let data = try! Data(contentsOf: url!)
        
        /// set data in from imgeView
        imageView.image = UIImage(data: data)
    }
}

