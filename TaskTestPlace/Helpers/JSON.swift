//
//  JSON.swift
//  TaskTestPlace
//
//  Created by 123 on 10.05.2023.
//

import Foundation

struct Info: Codable {
    let data: ObjectsData
    struct ObjectsData: Codable {
        let categories: [ObjectCategory]
        struct ObjectCategory: Codable, Identifiable {
            var id = UUID()
            let name: String
            let type: String
            let color: String
            let count: Int
            
            enum CodingKeys: String, CodingKey {
                case name = "name"
                case type = "type"
                case color = "color"
                case count = "count"
            }
        }
        
        let objects: [Object]
        struct Object: Codable, Identifiable {
            var id = UUID()
            let name: String
            let description: String
            let image: String
            let type: String
            let lat: CGFloat
            let lon: CGFloat
            let color: String
            
            enum CodingKeys: String, CodingKey {
                case name = "name"
                case type = "type"
                case description = "description"
                case image = "image"
                case lat = "lat"
                case lon = "lon"
                case color = "color"
            }
        }
    }
}
