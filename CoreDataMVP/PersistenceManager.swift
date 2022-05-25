//
//  PersistenceManager.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/24/22.
//

import UIKit
import CoreData

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {

//    var tasks: [Person] = []

//    static func getContext() -> NSManagedObjectContext {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        return appDelegate.persistentContainer.viewContext
//
//    }
//
//    static func saveTask(withTitle title: String) {
//        let context = getContext()
//
//        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
//
//        let taskObject = Task(entity: entity, insertInto: context)
//        taskObject.title = title
//
//        do {
//            try context.save()
//            tasks.append(taskObject)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//    }
}
