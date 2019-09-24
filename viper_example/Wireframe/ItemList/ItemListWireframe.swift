//
//  ItemListWireframe.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

class ItemListWireframe {
    private weak var viewController: ItemListViewController?

    required init(viewController: ItemListViewController) {
        self.viewController = viewController
    }
}

extension ItemListWireframe: ItemListWireframeDelegate {
    func showItemDetail(url: URL) {
        let itemDetailViewController = ItemDetailViewController(url: url)
        viewController?.navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
}
