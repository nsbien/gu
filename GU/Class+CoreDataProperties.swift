//
//  Class+CoreDataProperties.swift
//  GU
//
//  Created by Kyle Pavey on 12/1/20.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var name: String?

}

extension Class : Identifiable {

}
