//
//  ObjectsView.swift
//  TaskTestPlace
//
//  Created by 123 on 09.05.2023.
//

import SwiftUI
import Kingfisher

struct ObjectsView: View {
    @ObservedObject var viewModel: ObjectsViewModel
    var body: some View {
        List {
            ForEach(viewModel.model.objects) { object in
                CustomCellForObject(object: object)
                    .onTapGesture {
                        viewModel.open2GIS(to: object)
                    }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Объекты")
        .preferredColorScheme(.dark)
    }
}

struct ObjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsView(viewModel: ObjectsViewModel(model: ObjectsModel(objects: [])))
    }
}

struct CustomCellForObject: View {
    var object: Info.ObjectsData.Object
    var body: some View {
        HStack(spacing: 20) {
            if let url = URL(string: object.image) {
                KFImage(url)
                    .cacheMemoryOnly()
                    .cacheOriginalImage() 
                    .resizable()
                    .frame(width: 110, height: 75)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(object.name)
                    .font(Font.title)
                Text(object.description)
                    .lineLimit(2)
            }
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        .alignmentGuide(.listRowSeparatorLeading) { ViewDimensions in
            return 0
        }
    }
}
