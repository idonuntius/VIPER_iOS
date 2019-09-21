//
//  ItemEntity.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

struct ItemEntity: Codable {
    let title: String
    let body: String
    let commentsCount: Int
    let likesCounnt: Int
    let url: String
    let updatedAt: String
    let user: UserEntity

    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case body = "body"
        case commentsCount = "comments_count"
        case likesCounnt = "likes_count"
        case url = "url"
        case updatedAt = "updated_at"
        case user = "user"
    }
}
