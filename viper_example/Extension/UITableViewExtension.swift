//
//  UITableViewExtension.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/25.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func deselect() {
        if let indexPathForSelectedRow = indexPathForSelectedRow {
            deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
}
