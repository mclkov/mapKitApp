//
//  Places.swift
//  danske-task
//
//  Created by McL on 12/5/18.
//  Copyright © 2018 McL. All rights reserved.
//

struct Place: Decodable {
    let id: String?
    let type: String?
    let typeId: String?
    let score: Int?
    let name: String?
    let address: String?
    let coordinates: Coordinates?
    let area: Area?
    let lifeSpan: LifeSpan?

    private enum CodingKeys: String, CodingKey {
        case id, type, typeId = "type-id", score, name, address, coordinates, area, lifeSpan = "life-span"
    }
}
