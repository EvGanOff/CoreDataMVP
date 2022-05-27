//
//  DeteilsViewPresentor.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/24/22.
//

import Foundation

// MARK: - Output Protocol -

protocol DetailsViewProtocol: AnyObject {
    func showPersonInformation(_ person: Person)
    func updatePersonInformation()
}

// MARK: - Input Protocol -

protocol DetailsViewPresenterProtocol: AnyObject {
    init(view: DetailsViewProtocol, persistenceManager: PersistenceManagerProtocol)
    
    func updatePerson(name: String, birthday: String, gender: String)
    func showPersons()
    func returnMainView()
}

class DeteilsViewPresentor: DetailsViewPresenterProtocol {

    // MARK: - Properties -

    weak var view: DetailsViewProtocol?
    var persistenceManager: PersistenceManagerProtocol?
    var person: Person?
    var coordinator: MainCoordinator?

    // MARK: - Required Initialization -

    required init(view: DetailsViewProtocol, persistenceManager: PersistenceManagerProtocol) {
        self.view = view
        self.persistenceManager = persistenceManager
    }

    // MARK: - Presenter Metods -
    
    func showPersons() {
        guard let person = person else { return }
        view?.showPersonInformation(person)
    }

    func returnMainView() {
        guard let person = person else { return }
        coordinator?.popTo(.main(person))
    }

    func updatePerson(name: String, birthday: String, gender: String) {
        person?.name = name
        person?.birthday = birthday
        person?.gender = gender
        guard let person = person else { return }
        persistenceManager?.updatePerson(person: person, name: name, birthday: birthday, gender: gender)
    }
}
