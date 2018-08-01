//
//  PersonInfo+CoreDataProperties.swift
//  Students-details
//
//  Created by Anand on 29/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension PersonInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonInfo> {
        return NSFetchRequest<PersonInfo>(entityName: "PersonInfo");
    }

    @NSManaged public var college: String?
    @NSManaged public var dob: String?
    @NSManaged public var name: String?
    @NSManaged public var studentID: String?

}
