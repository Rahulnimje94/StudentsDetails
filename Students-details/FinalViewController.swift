//
//  FinalViewController.swift
//  Students-details
//
//  Created by Anand on 29/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import CoreData

class FinalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PersonInfo")
        
        do {
            let details = try managedContext.fetch(fetchRequest)
            print(details)
        } catch let error as NSError {
            print("could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    
   
}










