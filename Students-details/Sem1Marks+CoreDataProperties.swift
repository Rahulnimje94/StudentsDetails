//
//  Sem1Marks+CoreDataProperties.swift
//  Students-details
//
//  Created by Anand on 29/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import CoreData


extension Sem1Marks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sem1Marks> {
        return NSFetchRequest<Sem1Marks>(entityName: "Sem1Marks");
    }

    @NSManaged public var chemistry: String?
    @NSManaged public var mathe: String?
    @NSManaged public var physics: String?
    @NSManaged public var studentID: String?

}
