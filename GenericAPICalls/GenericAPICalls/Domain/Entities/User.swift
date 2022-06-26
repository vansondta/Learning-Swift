//
//  User.swift
//  GenericAPICalls
//
//  Created by TheLightLove on 06/06/2022.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Location
}

struct Location: Codable {
    let lat: String
    let lng: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

extension Array where Element == TodoList {
    func matching(_ text: String?) -> [TodoList] {
        if text?.count ?? 0 > 0 {
            return self.filter{$0.title.lowercased().contains(text!.lowercased())}
        } else {
            return self
        }
    }
}
