//
//  FetchUser.swift
//  GenericAPICalls
//
//  Created by TheLightLove on 06/06/2022.
//

import Foundation

protocol UsersInputProtocol: BaseMVPProtocol {
    func fetchUsers()
}

protocol UserOutPutProtocol: AnyObject {
    func disFishUsers(_ users: [Codable])
    func disFishUsersError(_ error: Error)
}

final class UsersPresenter: UsersInputProtocol {
    func fetchUsers() {
        URLSession.shared.request(url: Contants.usersUrl, exepting: [User].self) { [weak self] result in
            switch result {
            case .success(let users):
                self?.delegate?.disFishUsers(users)
            case .failure(let err):
                self?.delegate?.disFishUsersError(err)
            }
        }
    }

    weak var delegate: UserOutPutProtocol?
    func attachView(_ view: Any) {
        delegate = view as? UserOutPutProtocol
    }
}

// MARK: wite in viewcontroller
//func fetchListItem() {
//    URLSession.shared.request(url: Contants.todoListUrl, expecting: [TodoList].self) { [weak self] Results in
//        switch Results {
//        case .success(let models):
//            DispatchQueue.main.async {
//                self?.model = models
//                self?.tableView.reloadData()
//            }
//        case .failure(let error):
//            print(error)
//        }
//    }
//}
