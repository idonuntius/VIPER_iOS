//
//  ItemCell.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/25.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation
import UIKit

import Nuke

class ItemCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!

    func configure(thumbnailImageUrl: String, title: String, userName: String) {
        setupThumbnailImage(thumbnailImageUrl)
        setupTitleLabel(title)
        setupUserNameLabel(userName)
    }

    private func setupThumbnailImage(_ thumbnailUrl: String) {
        guard let url = URL(string: thumbnailUrl) else { return }
        Nuke.loadImage(with: url, into: thumbnailImage)
    }

    private func setupTitleLabel(_ title: String) {
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 16.0)
        titleLabel.textColor = .blue
        titleLabel.numberOfLines = 2
    }

    private func setupUserNameLabel(_ name: String) {
        userNameLabel.text = name
        userNameLabel.font = .systemFont(ofSize: 12)
        userNameLabel.textColor = .lightGray
    }
}
