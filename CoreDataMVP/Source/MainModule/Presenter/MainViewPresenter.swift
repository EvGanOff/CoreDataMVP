//
//  MainViewPresenter.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/23/22.
//

import Foundation

// MARK: - Output Protocol -

protocol MainViewProtocol: AnyObject {
    func reloadData()
    func addNewPerson()
}

// MARK: - Input Protocol -

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, persistenceManager: PersistenceManager)
    
    func selectPersonAt(index: Int)
    func addNewPerson(name: String)
    func getTableRowCount() -> Int?
    func getPersonNameAt(index: Int) -> String?
    func deletePersonAt(index: Int)
    func updateView()
}

class MainViewPresentor: MainViewPresenterProtocol {

    // MARK: - Properties -

    weak var view: MainViewProtocol?
    var person: Person?
    var persistenceManager: PersistenceManager?
    var coordinator: MainCoordinator?

    // MARK: - Required Initialization -

    required init(view: MainViewProtocol, persistenceManager: PersistenceManager) {
        self.view = view
        self.persistenceManager = persistenceManager
    }

    // MARK: - Presenter Metods -

    func addNewPerson(name: String) {
        persistenceManager?.createPerson(name: name, birthday: nil, gender: nil)
    }

    func getTableRowCount() -> Int? {
        guard let persistenceManager = persistenceManager else { return nil }
        return persistenceManager.getModels().count

    }

    func getPersonNameAt(index: Int) -> String? {
        guard let person = persistenceManager?.getModels()[index] else { return nil }
        let name = person.name
        return name
    }

    func selectPersonAt(index: Int) {
        guard let person = persistenceManager?.getModels()[index] else { return }
        coordinator?.pushTo(.detail(person))
    }

    func deletePersonAt(index: Int) {
        guard let person = persistenceManager?.getModels()[index] else { return }
        persistenceManager?.deletePerson(person: person)
    }

    func updateView() {
        view?.reloadData()
    }
}
