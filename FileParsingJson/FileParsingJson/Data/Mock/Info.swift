//
//  Info.swift
//  FileParsingJson
//
//  Created by TheLightLove on 05/06/2022.
//

import Foundation

final class userInfo {
    static let user: UserModel = {
        guard let path = Bundle.main.path(forResource: "info", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        else {
            fatalError("File mock.json does not exist")
        }

        guard let dataModel = try? JSONDecoder().decode(UserModel.self, from: data)
        else {
            fatalError("Json file has invalid format")
        }
        return dataModel
    }()

}

