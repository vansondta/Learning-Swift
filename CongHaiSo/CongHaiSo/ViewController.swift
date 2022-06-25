//
//  ViewController.swift
//  CongHaiSo
//
//  Created by TheLightLove on 23/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberTextOne: UITextField!
    @IBOutlet weak var numberTextTwo: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = UILabel(frame: CGRect(x: 10, y: 0, width: 110, height: numberTextOne.frame.size.height))
        label1.text = " Số thứ nhất:"
        numberTextOne.leftView = label1
        numberTextOne.leftViewMode = .always
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 0, width: 110, height: numberTextTwo.frame.size.height))
        label2.text = " Số thứ hai:"
        numberTextTwo.leftView = label2
        numberTextTwo.leftViewMode = .always

        // Do any additional setup after loading the view.
    }

    @IBAction func calculateNumberAction(_ sender: Any) {
        let numberOne = numberTextOne.text ?? ""
        let numberTwo = numberTextTwo.text ?? ""
        if numberOne == "" || numberTwo == "" {
            let alertController = UIAlertController(title: "Thông báo", message: "Vui lòng nhập đầy đủ 2 số", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(actionOk)
            self.present(alertController, animated: true)
            return
        }
        let result = Int(numberOne)! + Int(numberTwo)!
        resultLabel.text = "Kết quả: \(result)"
    }
    
}

