//
//  PersistenceManager.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/24/22.
//

import UIKit
import CoreData

protocol PersistenceManagerProtocol {
    func getModels() -> [Person]
    func createPerson(name: String?, birthday: String?, gender: String?)
    func updatePerson(person: Person, name: String?, birthday: String?, gender: String?)
    func deletePerson(person: Person)
}

class PersistenceManager: PersistenceManagerProtocol {
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func getModels() -> [Person] {
        var personModel: [Person] = []
        do {
            personModel = try context.fetch(Person.fetchRequest())
        } catch {
            _ = error
        }

        return personModel
    }

    func createPerson(name: String?, birthday: String?, gender: String?) {
        let person = Person(context: context)
        person.name = name
        person.birthday = birthday
        person.gender = gender

        do {
            try context.save()
        } catch {
            _ = error
        }
    }

    func updatePerson(person: Person, name: String?, birthday: String?, gender: String?) {
        person.name = name
        person.birthday = birthday
        person.gender = gender

        do {
            try context.save()
        } catch {
            _ = error
        }
    }

    func deletePerson(person: Person) {
        context.delete(person)
        do {
            try context.save()
        } catch {
            _ = error
        }
    }
}
