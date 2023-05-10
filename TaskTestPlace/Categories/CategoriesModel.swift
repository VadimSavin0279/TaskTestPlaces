//
//  Model.swift
//  TaskTestPlace
//
//  Created by 123 on 10.05.2023.
//

import Foundation

struct CategoriesModel {
    var categories: [Info.ObjectsData.ObjectCategory] = []
    var objects: [String: [Info.ObjectsData.Object]] = [:]
}
