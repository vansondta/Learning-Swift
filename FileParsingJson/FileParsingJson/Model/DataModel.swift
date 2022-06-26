//
//  DataModel.swift
//  FileParsingJson
//
//  Created by TheLightLove on 05/06/2022.
//

import Foundation

struct DataModel: Codable {
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let title:String
    let items:[String]
}

struct UserModel:Codable {
    let firth_Name:String
    let last_Name:String
    let age:Int
    let gender:Bool
}
