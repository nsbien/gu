//
//  AddClassViewController.swift
//  GU
//
//  Created by Nicole Bien on 11/27/20.
//

import UIKit

class AddClassViewController: UIViewController {
    
    @IBOutlet var courseName: UILabel!
    @IBAction func inputCourseName(_ sender: Any) {
    }
    @IBOutlet var startTime: UILabel!
    @IBAction func inputStartPicker(_ sender: Any) {
    }
    @IBOutlet weak var endTIme: UILabel!
    @IBAction func inputEndPicker(_ sender: Any) {
    }  
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeViewController().createNotifications(usingClass: <#T##Class#>)
        // Do any additional setup after loading the view.
    }
    

}
