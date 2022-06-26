//
//  TodoListViewController.swift
//  GenericAPICalls
//
//  Created by TheLightLove on 07/06/2022.
//

import UIKit

class TodoListViewController: UIViewController {
    lazy var prensenter: TodoListInputProtocol = TodoListPresenter()
    @IBOutlet weak var todoListTableView: UITableView!
    var todoList = [TodoList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        prensenter.fetchTodoList()
        prensenter.attachView(self)
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }

}

extension TodoListViewController: UITableViewDataSource {
    private func setUpTableView() {
        todoListTableView.dataSource = self
        todoListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let list = todoList[indexPath.row]
        cell.textLabel?.text = list.title
        cell.accessoryType = list.completed ? .checkmark : .none
        return cell
    }
}

extension TodoListViewController: TodoListOutPutProtocol {
    func disFishTodoList(_ list: [Codable]) {
        DispatchQueue.main.async {
            self.todoList = (list as? [TodoList])!
            self.todoListTableView.reloadData()
        }
    }
    
    func disFishTodoListError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    
}
