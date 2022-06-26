//
//  FetchTodoList.swift
//  GenericAPICalls
//
//  Created by TheLightLove on 07/06/2022.
//

import Foundation

protocol TodoListInputProtocol: BaseMVPProtocol {
    func fetchTodoList()
}

protocol TodoListOutPutProtocol: AnyObject {
    func disFishTodoList(_ list: [Codable])
    func disFishTodoListError(_ error: Error)
}

final class TodoListPresenter: TodoListInputProtocol {
    func fetchTodoList() {
        URLSession.shared.request(url: Contants.todoListUrl, exepting: [TodoList].self) { [weak self] result in
            switch result {
            case .success(let list):
                self?.delegate?.disFishTodoList(list)
            case .failure(let err):
                self?.delegate?.disFishTodoListError(err)
            }
        }
    }

    weak var delegate: TodoListOutPutProtocol?
    func attachView(_ view: Any) {
        delegate = view as? TodoListOutPutProtocol
    }
}
