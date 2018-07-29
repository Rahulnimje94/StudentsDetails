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
    lazy var studentDetails = [PersonInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDown.anchorView = viewList
        
        handlerDropDown()
        
        fetchRequest()
        
        
    }
    
    func fetchRequest(){
        coreDataHandler.fetchStudentInFo {[unowned self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let value):
                    self.studentDetails = value
                    let array = self.studentDetails.map{ $0.name ?? ""}
                    self.dropDown.dataSource = array
                case .failure(let error):
                    print(error.debugDescription)
                }
            }
        }
    }
    
    func handlerDropDown(){
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            let details = self.studentDetails.filter{ ($0.name ?? "") == item }
            print(details)
            self.fetchStudentFirstSem(details[0].studentID)
        }

    }
    
    func fetchStudentFirstSem(_ studentID: Int32){
        
    }
    
    
    @IBAction func actionShowList(_ sender: UIButton) {
        
        dropDown.show()
    }
    
}

