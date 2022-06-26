//
//  ViewController.swift
//  FileParsingJson
//
//  Created by TheLightLove on 04/06/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataModel: DataModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel = mock.page
        setUpTableView()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel!.data[section].items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataModel!.data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataModel!.data[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataModel?.data[indexPath.section].items[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Snell Roundhand", size: 17)
        cell.backgroundColor = indexPath.row % 2 == 0 ? .yellow : .green
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.title = "Information"
        self.present(vc, animated: true, completion: nil)
    }
}
