//
//  ViewController.swift
//  MayTinhBoTui
//
//  Created by TheLightLove on 23/05/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultTextFeild: UITextField!
    var phepTinh: String?
    var so1: Int!
    var so2: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func number0Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += ""
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number1Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "1"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number2Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "2"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number3Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "3"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number4Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "4"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number5Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "5"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number6Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "6"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number7Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "7"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func number8Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "8"
        // gán lại giá trị mới
        resultTextFeild.text = value

    }
    
    @IBAction func number9Action(_ sender: Any) {
        // Lấy giá trị textfield
        var value = resultTextFeild.text ?? ""
        // nối chuỗi
        value += "9"
        // gán lại giá trị mới
        resultTextFeild.text = value
    }
    
    @IBAction func plusAction(_ sender: Any) {
        phepTinh = "+"
        
        let value = resultTextFeild.text ?? "0"
        so1 = Int(value)
        
        resultTextFeild.text = ""
    }
    
    @IBAction func minusAction(_ sender: Any) {
        phepTinh = "-"
        
        let value = resultTextFeild.text ?? "0"
        so1 = Int(value)
        resultTextFeild.text = ""

    }
    
    @IBAction func multiAction(_ sender: Any) {
        phepTinh = "*"
        
        let value = resultTextFeild.text ?? "0"
        so1 = Int(value)
        
        resultTextFeild.text = ""

    }
    
    @IBAction func divideAction(_ sender: Any) {
        phepTinh = "/"
        
        let value = resultTextFeild.text ?? "0"
        so1 = Int(value)
        
        resultTextFeild.text = ""

    }
    
    @IBAction func resultAction(_ sender: Any) {
        let value = resultTextFeild.text ?? "0"
        so2 = Int(value)
        
        if phepTinh == "+" {
            let result = so1 + so2
            resultTextFeild.text = "\(result)"
        } else if phepTinh == "-" {
            let result = so1 - so2
            resultTextFeild.text = "\(result)"
        } else if phepTinh == "*" {
            let result = so1 * so2
            resultTextFeild.text = "\(result)"
        } else {
            let result = so1 / so2
            resultTextFeild.text = "\(result)"
        }
    }
    
    @IBAction func clearAction(_ sender: Any) {
        resultTextFeild.text = ""
    }
    
}

