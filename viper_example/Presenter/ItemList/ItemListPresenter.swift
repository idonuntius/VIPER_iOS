//
//  ItemListPresenter.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation

import RxSwift

class ItemListPresenter {
    enum SectionKind: CaseIterable {
        case item
    }

    private let itemListInteractor: ItemListInteractor
    private let wireframe: ItemListWireframeDelegate
    private let disposeBag = DisposeBag()

    private weak var view: ItemListPresenterDelegate?
    private var itemList: [ItemEntity] = []

    init(
        itemListInteractor: ItemListInteractor,
        wireframe: ItemListWireframeDelegate,
        view: ItemListPresenterDelegate
    ) {
        self.itemListInteractor = itemListInteractor
        self.wireframe = wireframe
        self.view = view
        getItemList()
    }

    private func getItemList() {
        itemListInteractor.get()
            .subscribeOn(SerialDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] values in
                    self?.itemList = values
                    self?.view?.reloadData()
                },
                onError: { error in
                    print("message: \(error.localizedDescription)")
                }
            )
            .disposed(by: disposeBag)
    }
}

extension ItemListPresenter {
    func numberOfSections() -> Int {
        return SectionKind.allCases.count
    }

    func tableView(numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }

    func tableView(cellForRowAt indexPath: IndexPath) -> (thumbnailUrl: String, title: String, name: String) {
        let item = itemList[indexPath.row]
        let name = item.user.name.isEmpty ? "no name" : "by \(item.user.name)"
        return (thumbnailUrl: item.user.profileImageUrl, title: item.title, name: name)
    }
}

extension ItemListPresenter {
    func tableView(didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: itemList[indexPath.row].url) else { return }
        wireframe.showItemDetail(url: url)
    }
}
