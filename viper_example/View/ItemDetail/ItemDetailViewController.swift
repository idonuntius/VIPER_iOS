//
//  ItemDetailViewController.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/25.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation
import SafariServices

class ItemDetailViewController: SFSafariViewController {
    init(url: URL) {
        super.init(url: url, configuration: .init())
    }
}
