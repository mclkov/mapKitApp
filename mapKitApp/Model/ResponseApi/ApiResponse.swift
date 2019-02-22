//
//  ApiResponse.swift
//  danske-task
//
//  Created by McL on 12/5/18.
//  Copyright © 2018 McL. All rights reserved.
//

struct ApiResponse: Decodable {
    let created: String?
    let count: Int?
    let offset: Int?
    let places: [Place]?
}
