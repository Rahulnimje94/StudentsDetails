//
//  ViewController.swift
//  Students-details
//
//  Created by Anand on 27/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import DropDown
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonList: UIButton!
    @IBOutlet weak var viewList: UIView!
    lazy var coreDataHandler = CoreDataHandler()
    
    lazy var dropDown = DropDown()
    @IBOutlet weak var mainView: UIView!
    var studentInFo: PersonInfo!
    lazy var studentDetails = [PersonInfo]()
    lazy var firstSemMarks = [Sem1Marks]()
    lazy var secondSemMarks = [Sem2Marks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.anchorView = viewList
        
        handlerDropDown()
        
        fetchRequest()
    }
    
    
    //MARK: - Fetching here Students Names
    func fetchRequest(){
        coreDataHandler.fetchStudentInFo {[unowned self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let value):
                    guard value.count != 0 else { return }
                    self.studentDetails = value
                    let array = self.studentDetails.map{ $0.name ?? ""}
                    self.dropDown.dataSource = array
                    case .failure(let error):
                    print(error.debugDescription)
                }
            }
        }
    }
    
    //MARK: - Getting here selected name
    func handlerDropDown(){
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
    
            let details = self.studentDetails.filter{ ($0.name ?? "") == item }
            guard details.count != 0 else {
                return
            }
            print(details)
            self.studentInFo = details[0]
            self.fetchStudentFirstSem(details[0].studentID)
        }

    }
    
    //MARK: - Getting Student Details
    func fetchStudentFirstSem(_ studentID: Int32){
        coreDataHandler.fetchFirstSemSubjectMarks { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    let array = value.filter{$0.studentID == studentID}
                    self.firstSemMarks = array
                    self.fetchStudentSecondSem(studentID)
                case .failure(let error):
                    print(error.debugDescription)
                }
            }
        }
    }
    
    func fetchStudentSecondSem(_ studentID: Int32){
        coreDataHandler.fetchSecondSemSubjectMarks { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    let array = value.filter{$0.studentID == studentID}
                    self.secondSemMarks = array
                    self.gotoDetailsPage()
                case .failure(let error):
                    print(error.debugDescription)
                }
            }
        }
    }
    
    func gotoDetailsPage(){
        guard let finalDetails = self.storyboard?.instantiateViewController(withIdentifier: "FinalViewController") as? FinalViewController else {
            return
        }
        finalDetails.studentDetails = studentInFo
        finalDetails.firstSemMarks = firstSemMarks[0]
        finalDetails.secondSemMarks = secondSemMarks[0]
        navigationController?.pushViewController(finalDetails, animated: true)
        
    }
    
    
    @IBAction func actionShowList(_ sender: UIButton) {
        
        dropDown.show()
    }
    
}

