//
//  MainViewPresenter.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/23/22.
//

import Foundation

// Output
protocol MainViewProtocol: AnyObject {
    func onAddItem(title: String)
    func onDeleteItem(index: Int)
    func onGetItems(titles: [String])
}

// Input
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol)
    func add(title: String)
    func delete(index: Int)
    // persisManager
    // model
}

class MainViewPresentor: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    private var items: [String]?

    required init(view: MainViewProtocol) {
        self.view = view
        getItems()
    }

    func delete(index: Int) {
        deleteItem(at: index)
    }

    func add(title: String) {
        addItem(title: title)
    }

    private func addItem(title: String) {
        items?.append(title)
        view?.onAddItem(title: title)
    }

    private func getItems() {
        items = ["1"]
        view?.onGetItems(titles: items ?? [])
    }

    private func deleteItem(at index: Int) {
        if var items = items {
            items.remove(at: index)
            view?.onDeleteItem(index: index)
        }
    }
}
