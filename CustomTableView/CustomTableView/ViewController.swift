//
//  ViewController.swift
//  CustomTableView
//
//  Created by TheLightLove on 19/05/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countryTableView: UITableView!
    let countries = ["Việt Nam","Timor leste","Thailand","Philippines","Malaysia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.delegate = self
        countryTableView.dataSource = self
        countryTableView.separatorStyle = .none
        countryTableView.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell
        cell?.countryCell(countries[indexPath.row])
        return cell!
    }
    
    
}
