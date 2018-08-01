//
//  Sem2MarksViewController.swift
//  Students-details
//
//  Created by Anand on 28/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class Sem2MarksViewController: UIViewController, UITextFieldDelegate {
    
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

        englishTextField.delegate = self
        englishTextField.keyboardType = .numberPad
        hindiTextfield.delegate = self
        hindiTextfield.keyboardType = .numberPad
        frenchTextfield.delegate = self
        frenchTextfield.keyboardType = .numberPad

    }

    //MARK: - Finally Save data here 
    @IBAction func submitButton(_ sender: Any) {
        self.view.endEditing(true)
        coreDataHandler.saveStudentDetails(name: studentDetails.name, dob: studentDetails.dob, collageName: studentDetails.collageName)
        coreDataHandler.saveFirstSemSubjectsMarks(physics: subjectMarks.physics, chemistry: subjectMarks.chemistry, maths: subjectMarks.maths)
        coreDataHandler.saveSecondSemSubjectsMarks(english: englishTextField.text ?? "",
                                                   Hindi: hindiTextfield.text ?? "",
                                                   french: frenchTextfield.text ?? "")
        
        guard let ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("\(#function) View Controller not found")
        }
        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let numberCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: numberCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }

}
