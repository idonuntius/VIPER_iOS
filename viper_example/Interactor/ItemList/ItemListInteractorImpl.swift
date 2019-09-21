//
//  ItemListInteractorImpl.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import Alamofire
import RxSwift

class ItemListInteractorImpl: ItemListInteractor {
    func get() -> Single<[ItemEntity]> {
        return Single.create { observer -> Disposable in
            let url = ApiConstants.itemListUrl
            let header = ["Authorization": "Bearer \(ApiConstants.accessToken)"]
            Alamofire.request(url, method: .get, headers: header).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let data = try JSONDecoder().decode([ItemEntity].self, from: data)
                        observer(.success(data))
                    } catch let error {
                        observer(.error(error))
                    }
                case .failure(let error):
                    observer(.error(error))
                }
            }
            return Disposables.create()
        }
    }
}
