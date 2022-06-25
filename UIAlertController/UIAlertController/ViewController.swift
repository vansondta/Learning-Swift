//
//  ViewController.swift
//  UIAlertController
//
//  Created by TheLightLove on 23/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertAction(_ sender: Any) {
        let alertController = UIAlertController(title: "alert", message: "This is alert controller", preferredStyle: .actionSheet)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
            print("Action Ok")
        }
        
        let actionDestructive = UIAlertAction(title: "Destructive", style: .destructive) { _ in
            print("Action destructive")
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Action cancel")
        }
        
        alertController.addAction(actionOk)
        alertController.addAction(actionDestructive)
        alertController.addAction(actionCancel)
        self.present(alertController, animated: true)
    }
    
}

