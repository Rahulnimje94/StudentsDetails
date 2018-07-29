//
//  CoreDataHandler.swift
//  Students-details
//
//  Created by Anand on 29/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import CoreData


enum Results<Value> {
    case success(Value)
    case failure(Error?)
}

struct CoreDataHandler {
    
    fileprivate let appDelegate = UIApplication.shared.delegate as! AppDelegate
    fileprivate let randomNumber: Int32 = Int32(arc4random()) //Student ID
    
    func fetchStudentInFo(completionHandler:@escaping (Results<[PersonInfo]>)-> Void){
        DispatchQueue.main.async {
            let managedContext = self.appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonInfo")
            do {
                let details = try managedContext.fetch(fetchRequest) as! [PersonInfo]
                completionHandler(.success(details))
            } catch let error as NSError {
                print("could not fetch. \(error), \(error.userInfo)")
                completionHandler(.failure(error))
            }
        }
    }
    
    func saveStudentDetails(name: String, dob: String, collageName: String){
       
        let managedContext = appDelegate.persistentContainer.viewContext
        DispatchQueue.main.async {
            let entity = NSEntityDescription.entity(forEntityName: "PersonInfo", in: managedContext)
            let person = NSManagedObject(entity: entity!, insertInto: managedContext)
            person.setValue(name, forKey: "name")
            person.setValue(dob, forKey: "dob")
            person.setValue(collageName, forKey: "college")
            person.setValue(self.randomNumber, forKey: "studentID")
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("could not save. \(error), \(error.userInfo)")
            }

        }
        
    }
    
    func saveFirstSemSubjectsMarks(physics: String, chemistry: String, maths: String){
    
        let managedContext = appDelegate.persistentContainer.viewContext
        
        DispatchQueue.main.async {
            let entity = NSEntityDescription.entity(forEntityName: "Sem1Marks", in: managedContext)
            let marks = NSManagedObject(entity: entity!, insertInto: managedContext)
            marks.setValue(physics, forKey: "physics")
            marks.setValue(chemistry, forKey: "chemistry")
            marks.setValue(maths, forKey: "mathe")
            marks.setValue(self.randomNumber, forKey: "studentID")
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveSecondSemSubjectsMarks(english: String, Hindi: String, french: String){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        DispatchQueue.main.async {
            let entity = NSEntityDescription.entity(forEntityName: "Sem2Marks", in: managedContext)
            let marks = NSManagedObject(entity: entity!, insertInto: managedContext)
            marks.setValue(english, forKey: "english")
            marks.setValue(Hindi, forKey: "Hindi")
            marks.setValue(french, forKey: "french")
            marks.setValue(self.randomNumber, forKey: "studentID")
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("could not save. \(error), \(error.userInfo)")
            }
        }

    }

}
