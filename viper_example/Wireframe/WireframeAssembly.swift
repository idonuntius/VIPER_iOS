//
//  WireframeAssembly.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import Swinject
import SwinjectStoryboard

struct WireframeAssembly: Assembly{
    func assemble(container: Container) {
        container.register(ItemListWireframe.self) { (resolver, viewController: ItemListViewController) in
            ItemListWireframe(viewController: viewController)
        }
    }
}
