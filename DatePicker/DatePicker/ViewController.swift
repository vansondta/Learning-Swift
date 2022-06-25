//
//  ViewController.swift
//  DatePicker
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /// xét ngày hiển thị khi vào app
        let stringDate = "01-01-2000"
        
        /// xét kiểu hiển thị
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-mm-yyyy"
        
        /// lấy date theo string
        let date = dateFormater.date(from: stringDate)
        
        /// xét ngày hiển thị trên datePicker
        datePicker.setDate(date!, animated: true)
        
        resultLabel.text = stringDate
    }

    @IBAction func valueChangedPicker(_ sender: UIDatePicker) {
        let selecDate = sender.date
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-mm-yyyy"
        let stringDate = dateFormater.string(from: selecDate)
        
        resultLabel.text = "\(stringDate)"
    }
    
}

