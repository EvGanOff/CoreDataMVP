//
//  AssemblyLayer.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/23/22.
//

import UIKit

protocol MainAssembly {
    static func createMainModule(_ coordinator: MainCoordinator) -> UIViewController
    static func createDetailsModule(_ model: Person?, _ coordinator: MainCoordinator) -> UIViewController
}

class MainScreenBuilder: MainAssembly {

    static func createMainModule(_ coordinator: MainCoordinator) -> UIViewController {
        let view = MainViewController()
        let persistenceManager = PersistenceManager()
        let presenter = MainViewPresentor(view: view,persistenceManager: persistenceManager)

        view.presenter = presenter
        presenter.persistenceManager = persistenceManager
        presenter.coordinator = coordinator

        return view
    }

    static func createDetailsModule(_ model: Person?, _ coordinator: MainCoordinator) -> UIViewController {
        let view = DetailsListViewController()
        let persistenceManager = PersistenceManager()
        let presenter = DeteilsViewPresentor(view: view, persistenceManager: persistenceManager)

        view.presenter = presenter
        presenter.persistenceManager = persistenceManager
        presenter.coordinator = coordinator
        presenter.person = model

        return view
    }
}
