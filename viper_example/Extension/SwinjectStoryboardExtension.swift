//
//  SwinjectStoryboardExtension.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        let assembler = Assembler(container: SwinjectStoryboard.defaultContainer)
        assembler.apply(assemblies: [
            InteractorAssembly(),
            PresenterAssembly(),
            WireframeAssembly(),
            ViewAssembly()
        ])
    }
}
