//
//  UserEntity.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

struct UserEntity: Codable {
    let description: String?
    let name: String
    let profileImageUrl: String

    private enum CodingKeys: String, CodingKey {
        case description = "description"
        case name = "name"
        case profileImageUrl = "profile_image_url"
    }
}
