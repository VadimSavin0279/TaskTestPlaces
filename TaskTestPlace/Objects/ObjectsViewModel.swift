//
//  ObjectsViewModel.swift
//  TaskTestPlace
//
//  Created by 123 on 10.05.2023.
//

import Foundation
import SwiftUI

class ObjectsViewModel: ObservableObject {
    @Published var model: ObjectsModel
    init(model: ObjectsModel) {
        self.model = model
    }
    
    func open2GIS(to object: Info.ObjectsData.Object) {
        if let url = URL(string: "dgis://"), UIApplication.shared.canOpenURL(url),
           let openurl = URL(string: "dgis://2gis.ru/routeSearch/rsType/car/to/\(object.lon),\(object.lat)") {
            UIApplication.shared.open(openurl)
        } else if let url = URL(string: "https://itunes.apple.com/ru/app/id481627348?mt=8") {
            UIApplication.shared.open(url)
        }
    }
}
