//
//  Class+CoreDataProperties.swift
//  GU
//
//  Created by Kyle Pavey on 12/2/20.
//
//

import Foundation
import CoreData


extension Class {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Class> {
        return NSFetchRequest<Class>(entityName: "Class")
    }

    @NSManaged public var name: String?
    @NSManaged public var building: String?
    @NSManaged public var roomNumber: Int16
    @NSManaged public var meetingTime: Date?

}

extension Class : Identifiable {

}
