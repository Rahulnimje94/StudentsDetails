//
//  Sem1MarksViewController.swift
//  Students-details
//
//  Created by Anand on 27/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit


class Sem1MarksViewController: UIViewController, UITextFieldDelegate {
    
    var studentDetails = (name: "", dob: "", collageName: "")
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var physicsLabel: UILabel!
    @IBOutlet weak var chemistryLabel: UILabel!
    @IBOutlet weak var matheLabel: UILabel!

    @IBOutlet weak var physicsTextField: UITextField!
    @IBOutlet weak var chemistryTextField: UITextField!
    @IBOutlet weak var matheTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        physicsTextField.delegate = self
        physicsTextField.keyboardType = .numberPad
        chemistryTextField.delegate = self
        chemistryTextField.keyboardType = .numberPad
        matheTextField.delegate = self
        matheTextField.keyboardType = .numberPad

    }
    
    //MARK: - Save & Next Process
    @IBAction func nextButton(_ sender: Any) {
        self.view.endEditing(true)
        guard let sem2VC = storyboard?.instantiateViewController(withIdentifier: "sem2MarksViewController") as? Sem2MarksViewController else {
            fatalError("\(#function) View Controller not found")
        }
        sem2VC.studentDetails = studentDetails
        sem2VC.subjectMarks = (physics: physicsTextField.text ?? "", chemistry: chemistryTextField.text ?? "", maths: matheTextField.text ?? "")
        self.navigationController?.pushViewController(sem2VC, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let numberCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: numberCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    

    
}
















