//
//  ViewAssembly.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import Swinject
import SwinjectStoryboard

struct ViewAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(ItemListViewController.self) { resolver, viewController in
            viewController.presenter = resolver.resolve(ItemListPresenter.self, argument: viewController)!
        }
    }
}
