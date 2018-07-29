//
//  InfoViewController.swift
//  Students-details
//
//  Created by Anand on 27/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import CoreData
import DatePickerDialog

class InfoViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var collegeTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    @IBAction func datePickerButten(_ sender: Any) {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy"
                self.dateTextField.text = formatter.string(from: dt)
            }
        }
    }

    
    @IBAction func saveButten(_ sender: Any) {
        saveData(name: nameTextField.text!, dob: dateTextField.text!, college: collegeTextField.text!)
    }
    
    func saveData(name: String, dob: String, college: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "PersonInfo", in: managedContext)
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        person.setValue(name, forKey: "name")
        person.setValue(dob, forKey: "dob")
        person.setValue(college, forKey: "college")
        
        do {
            try managedContext.save()
            } catch let error as NSError {
            print("could not save. \(error), \(error.userInfo)")
        }

    }
    
    //MARK: - Passing here details
    @IBAction func nextButten(_ sender: Any) {
        self.view.endEditing(true)
        guard let sem1VC = storyboard?.instantiateViewController(withIdentifier: "sem1MarksViewController") as? Sem1MarksViewController else {
            fatalError("\(#function) View Controller not found")
        }
        sem1VC.studentDetails = (name: nameTextField.text ?? "", dob: dateTextField.text ?? "", collageName: collegeTextField.text ?? "")
        self.navigationController?.pushViewController(sem1VC, animated: true)
    }
    
    
}

















