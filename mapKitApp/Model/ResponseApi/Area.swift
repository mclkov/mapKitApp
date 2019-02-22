//
//  Area.swift
//  danske-task
//
//  Created by McL on 12/5/18.
//  Copyright © 2018 McL. All rights reserved.
//

struct Area: Decodable {
    let id: String?
    let type: String?
    let typeId: String?
    let name: String?
    let sortName: String?
    let lifeSpan: LifeSpan?

    private enum CodingKeys: String, CodingKey {
        case id, type, typeId = "type-id", name, sortName = "sort-name", lifeSpan = "life-span"
    }
}
