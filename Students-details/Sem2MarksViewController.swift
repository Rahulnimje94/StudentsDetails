//
//  Sem2MarksViewController.swift
//  Students-details
//
//  Created by Anand on 28/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class Sem2MarksViewController: UIViewController {
    
    lazy var coreDataHandler = CoreDataHandler()
    
    @IBOutlet weak var subjectsLabel: UILabel!
    var studentDetails = (name: "", dob: "", collageName: "")
    var subjectMarks   = (physics: "", chemistry: "", maths: "")
    
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var hindiLabel: UILabel!
    @IBOutlet weak var frenchLabel: UILabel!
    
    @IBOutlet weak var englishTextField: UITextField!
    @IBOutlet weak var hindiTextfield: UITextField!
    @IBOutlet weak var frenchTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - Finally Save data here 
    @IBAction func submitButton(_ sender: Any) {
        self.view.endEditing(true)
        coreDataHandler.saveStudentDetails(name: studentDetails.name, dob: studentDetails.dob, collageName: studentDetails.collageName)
        coreDataHandler.saveFirstSemSubjectsMarks(physics: subjectMarks.physics, chemistry: subjectMarks.chemistry, maths: subjectMarks.maths)
        coreDataHandler.saveSecondSemSubjectsMarks(english: englishTextField.text ?? "",
                                                   Hindi: hindiTextfield.text ?? "",
                                                   french: frenchTextfield.text ?? "")
        
//        guard let finalViewController = storyboard?.instantiateViewController(withIdentifier: "FinalViewController") as? FinalViewController else {
//            fatalError("\(#function) View Controller not found")
//        }
//        self.navigationController?.pushViewController(finalViewController, animated: true)
    }
    


}
