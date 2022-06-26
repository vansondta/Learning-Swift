//
//  InfoViewController.swift
//  FileParsingJson
//
//  Created by TheLightLove on 05/06/2022.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var infoTableView: UITableView!
    let info: UserModel = userInfo.user
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }

    @IBAction func dismissViewAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    func setUpTableView() {
        infoTableView.dataSource = self
        infoTableView.delegate = self
        infoTableView.estimatedRowHeight = 44
        infoTableView.rowHeight = UITableView.automaticDimension
        infoTableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        cell.getData(info)
        return cell
    }
}
