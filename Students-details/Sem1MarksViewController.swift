//
//  Sem1MarksViewController.swift
//  Students-details
//
//  Created by Anand on 27/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit


class Sem1MarksViewController: UIViewController {
    
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
    
}
















