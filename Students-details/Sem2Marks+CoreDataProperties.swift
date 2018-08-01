//
//  Sem2Marks+CoreDataProperties.swift
//  Students-details
//
//  Created by Anand on 29/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import CoreData


extension Sem2Marks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sem2Marks> {
        return NSFetchRequest<Sem2Marks>(entityName: "Sem2Marks");
    }

    @NSManaged public var english: String?
    @NSManaged public var french: String?
    @NSManaged public var hindi: String?
    @NSManaged public var studentID: String?

}
