//
//  ViewController.swift
//  PickerView
//
//  Created by TheLightLove on 24/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    let arrImge = ["CaSot", "Doitruongxaothapcam", "Echchiensa", "ThitKhoTrung"]
    let arrName = ["Cá sốt", "Dồi trường xào thập cẩm", "Ếch chiên sả", "Thịt kho trứng"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        foodLabel.text = arrName[0]
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.pickerView.frame.height
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.pickerView.frame.width - 40, height: self.pickerView.frame.height - 40))
        imageView.image = UIImage(named: arrImge[row])
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        foodLabel.text = arrName[row]
    }
}
