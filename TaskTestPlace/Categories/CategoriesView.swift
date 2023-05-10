//
//  ContentView.swift
//  TaskTestPlace
//
//  Created by 123 on 09.05.2023.
//
import SwiftUI

struct CategoriesView: View {
    @ObservedObject var viewModel: CategoriesViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.model.categories) { item in
                    CustomCell(category: item, objects: viewModel.model.objects[item.type] ?? [])
                }
            }
            .listStyle(.plain)
                .navigationTitle("Категории")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(viewModel: CategoriesViewModel())
    }
}

struct CustomCell: View {
    var category: Info.ObjectsData.ObjectCategory
    var objects: [Info.ObjectsData.Object]
    var body: some View {
        GeometryReader { frame in
            HStack(alignment: .center, spacing: -0.9 * frame.size.width) {
                HStack {
                    Text(category.name)
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundColor(Color(objects.first?.color ?? ""))
                        Text("\(category.count)")
                            .foregroundColor(.white)
                    }
                }
                NavigationLink(destination: ObjectsView(viewModel: ObjectsViewModel(model: ObjectsModel(objects: objects)))) {
                    EmptyView()
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
