//
//  InteractorAssembly.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import Swinject

struct InteractorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ItemListInteractor.self) { _ in
            ItemListInteractorImpl()
        }.inObjectScope(.container)
    }
}
