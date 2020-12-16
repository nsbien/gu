//
//  AddClassViewController.swift
//  GU
//
//  Created by Nicole Bien on 11/27/20.
//

import UIKit

class AddClassViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet var courseName: UILabel!
    @IBAction func inputCourseName(_ sender: Any) {
    }
    @IBOutlet var startTime: UILabel!
    @IBAction func inputStartPicker(_ sender: Any) {
    }
    @IBOutlet weak var endTIme: UILabel!
    @IBAction func inputEndPicker(_ sender: Any) {
    }  
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var locationInput: UITextField!
    var selectedLocation: String?
    var locationsPicker: [String] = ["College Hall", "Coughlin Hall", "Crosby Center", "Foley Library", "Herek Center", "Humanities Building", "Human Physiology", "Hughes Hall", "Journalism/Broadcast Integrated Media", "Jepson Center", "Jundt Art Center & Museum", "Law School", "Magnuson Theatre (Performing Arts)", "Martin Centre (Rudolf Fitness)", "McCarthey Athletic Center", "Music Building (Monaghan Mansion)", "Music Hall", "Music Annex", "PACCAR Center (Applied Science", "Peerless Building (Human Physiology/Theatre Annex)", "Rosauer Center (Education)", "Tilford Center", "Theatre/Dance Studios", "Myrtle Woldson Performing Arts Center"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
//        HomeViewController().createNotifications(usingClass: Class)
    }
    
    
    @IBAction func addButtonPressed() {
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                center.requestAuthorization(options: options) { (granted, error) in
                    if !granted {
                        print("Something went wrong")
                    }
                }
             }
         }
        //for _ in classList {
        //temp date
        let date = Date(timeIntervalSinceNow: 5)
        let content = UNMutableNotificationContent()
        content.title = "Don't forget"
        content.body = "Buy some milk"
        content.sound = UNNotificationSound.default
        let triggerWeekly = Calendar.current.dateComponents([.weekday, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                print("error")
            }
        })
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationsPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationsPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLocation = locationsPicker[row]
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        locationInput.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
            
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        locationInput.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        view.endEditing(true)
    }

}
