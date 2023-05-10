//
//  Service.swift
//  TaskTestPlace
//
//  Created by 123 on 10.05.2023.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    private let manager = APIManager()
    @Published var model = CategoriesModel()
    
    init() {
        fetchObjects()
    }
    
    private func fetchObjects() {
        manager.sendRequest(with: ObjectsProvider.getObjects, decodeType: Info.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.processData(info: data)
                    self.model.categories = data.data.categories
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func processData(info: Info) {
        for object in info.data.objects {
            if let _ = model.objects[object.type] {
                model.objects[object.type]?.append(object)
            } else {
                model.objects[object.type] = [object]
            }
        }
    }
}
