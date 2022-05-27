//
//  Person+CoreDataProperties.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/26/22.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var birthday: String?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?

}

extension Person: Identifiable {

}
