//
//  ViewController.swift
//  GenericAPICalls
//
//  Created by TheLightLove on 06/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var presenter: TodoListInputProtocol = TodoListPresenter()
    var todoList = [TodoList]()
    
    var searchController = UISearchController()
    
    var filterList = [TodoList]()
    var filteredList: [TodoList] {
        filterList = []
        if searchController.searchBar.text == "" {
            return todoList
        } else {
            return todoList.filter { $0.title.lowercased().contains(searchController.searchBar.text!.lowercased())}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        presenter.fetchTodoList()
        presenter.attachView(self)
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setUpSearchController() {
        title = "Search"
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
}

extension ViewController: UITableViewDataSource {
    func setUpTableView() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let todo = filterList[indexPath.row]
        cell.textLabel?.text = todo.title
        cell.accessoryType = todo.completed ? .checkmark : .none
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterList = filteredList
        self.filterList = self.todoList.matching(self.searchController.searchBar.text?.lowercased())
        self.tableView.reloadData()
    }
}

extension ViewController: TodoListOutPutProtocol {
    func disFishTodoList(_ list: [Codable]) {
        DispatchQueue.main.async {
            self.todoList = (list as! [TodoList])
            self.filterList = self.todoList
            self.tableView.reloadData()
        }
    }
    
    func disFishTodoListError(_ error: Error) {
        print(error)
    }
    
}
