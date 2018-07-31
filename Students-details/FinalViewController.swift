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
    
    var studentDetails: PersonInfo!
    var firstSemMarks: Sem1Marks!
    var secondSemMarks: Sem2Marks!
    
    @IBOutlet weak var labelFillName: UILabel!
    @IBOutlet weak var labelFillDob: UILabel!
    @IBOutlet weak var labelFillCollegeName: UILabel!
    
    @IBOutlet weak var labelFillPhysicsMark: UILabel!
    @IBOutlet weak var labelFillChemistryMarks: UILabel!
    @IBOutlet weak var labelFillMathsMarks: UILabel!
    
    @IBOutlet weak var labelFillEnglishMarks: UILabel!
    @IBOutlet weak var labelFillHindiMarks: UILabel!
    @IBOutlet weak var labelFillFrenchMarks: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(studentDetails, firstSemMarks, secondSemMarks)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        studentDetail()
        firstSemMark()
        secondSemMark()
    }
    
    func studentDetail() {
        if let fillName = studentDetails.name {
            labelFillName.text = fillName
        }
        
        if let fillDob = studentDetails.dob {
            labelFillDob.text = fillDob
        }
        
        if let fillCollegeName = studentDetails.college {
            labelFillCollegeName.text = fillCollegeName
        }
    }
    
    func firstSemMark() {
        if let physicsMark = firstSemMarks.physics {
            labelFillPhysicsMark.text = physicsMark
        }
        
        if let chemistryMark = firstSemMarks.chemistry {
            labelFillChemistryMarks.text = chemistryMark
        }
        
        if let mathsMark = firstSemMarks.mathe {
            labelFillMathsMarks.text = mathsMark
        }
    }
    
    func secondSemMark(){
        if let englishMark = secondSemMarks.english {
            labelFillEnglishMarks.text = englishMark
        }
        
        if let hindiMark = secondSemMarks.hindi {
            labelFillHindiMarks.text = hindiMark
        }
        
        if let frenchMark = secondSemMarks.french {
            labelFillFrenchMarks.text = frenchMark
        }
    }
   
}










