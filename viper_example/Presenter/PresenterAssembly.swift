//
//  PresenterAssembly.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import Swinject
import SwinjectStoryboard

struct PresenterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ItemListPresenter.self) { (resolver, viewController: ItemListViewController) in
            ItemListPresenter(
                itemListInteractor: resolver.resolve(ItemListInteractor.self)!,
                wireframe: resolver.resolve(ItemListWireframe.self, argument: viewController)!,
                view: viewController
            )
        }
    }
}
