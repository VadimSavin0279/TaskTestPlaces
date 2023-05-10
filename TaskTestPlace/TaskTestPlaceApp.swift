//
//  TaskTestPlaceApp.swift
//  TaskTestPlace
//
//  Created by 123 on 09.05.2023.
//

import SwiftUI

@main
struct TaskTestPlaceApp: App {
    var body: some Scene {
        WindowGroup {
            CategoriesView(viewModel: CategoriesViewModel())
        }
    }
}
