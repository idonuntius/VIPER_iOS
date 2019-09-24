//
//  ItemListViewController.swift
//  viper_example
//
//  Created by NatsukiIdota on 2019/09/22.
//  Copyright © 2019 idonuntius. All rights reserved.
//

import Foundation
import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var presenter: ItemListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigator()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.deselect()
    }

    private func setupNavigator() {
        navigationItem.title = "アイテム一覧"
    }
}

extension ItemListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableView(numberOfRowsInSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.itemCell, for: indexPath)!
        let data = presenter.tableView(cellForRowAt: indexPath)
        cell.configure(thumbnailImageUrl: data.thumbnailUrl, title: data.title, userName: data.name)
        return cell
    }
}

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tableView(didSelectRowAt: indexPath)
    }
}

extension ItemListViewController: ItemListPresenterDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}
