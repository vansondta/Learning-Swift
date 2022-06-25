//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by TheLightLove on 26/05/2022.
//

import UIKit

struct foodItem {
    var name: String
    var image: String
}
class ViewController: UIViewController {
    @IBOutlet weak var foodTableView: UITableView!
    let arrItem = [foodItem(name: "Cá Sốt", image: "CaSot"),
                   foodItem(name: "Dồi trường xào thập cẩm", image: "Doitruongxaothapcam"),
                   foodItem(name: "Ếch chiên sả", image: "Echchiensa"),
                   foodItem(name: "Thịt kho trứng", image: "ThitKhoTrung")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTableView.delegate = self
        foodTableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItem.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! FoodTableViewCell
        let item = arrItem[indexPath.row]
        cell.setData(item)
        return cell
    }
    
    
}
