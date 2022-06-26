//
//  TodoList.swift
//  GenericAPICalls
//
//  Created by TheLightLove on 07/06/2022.
//

import Foundation

struct TodoList: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
