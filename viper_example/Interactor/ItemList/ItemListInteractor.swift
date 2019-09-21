//
//  ItemListInteractor.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import RxSwift

protocol ItemListInteractor: AnyObject {
    func get() -> Single<[ItemEntity]>
}
