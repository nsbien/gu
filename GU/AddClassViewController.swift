//
//  AddClassViewController.swift
//  GU
//
//  Created by Nicole Bien on 11/27/20.
//

import UIKit

class AddClassViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    
    var selectedTime: Date?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet var courseName: UILabel!
    @IBOutlet var inputCourseName: UITextField!
    @IBOutlet var startTime: UILabel!
    @IBAction func inputStartPicker(_ sender: UIDatePicker) {
        selectedTime = sender.date
    }
    @IBOutlet weak var endTIme: UILabel!
    @IBAction func inputEndPicker(_ sender: Any) {
    }  
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var locationInput: UITextField!
    var selectedLocation: String?
    var locationsPicker: [String] = ["College Hall", "Coughlin Hall", "Crosby Center", "Foley Library", "Herek Center", "Humanities Building", "Human Physiology", "Hughes Hall", "Journalism/Broadcast Integrated Media", "Jepson Center", "Jundt Art Center & Museum", "Law School", "Magnuson Theatre (Performing Arts)", "Martin Centre (Rudolf Fitness)", "McCarthey Athletic Center", "Music Building (Monaghan Mansion)", "Music Hall", "Music Annex", "PACCAR Center (Applied Science", "Peerless Building (Human Physiology/Theatre Annex)", "Rosauer Center (Education)", "Tilford Center", "Theatre/Dance Studios", "Myrtle Woldson Performing Arts Center"]
    
    var weekdays: [Int] = []
    var isCheckedMon = false
    var isCheckedTue = false
    var isCheckedWed = false
    var isCheckedThu = false
    var isCheckedFri = false
    
    @IBOutlet weak var mondayOutlet: UIButton!
    @IBAction func monday(_ sender: Any){
        if isCheckedMon == false {
            mondayOutlet.setImage(UIImage(named: "checked.png"), for: .normal)
            isCheckedMon = true
            weekdays.append(2)
        } else {
            mondayOutlet.setImage(UIImage(named: "box.png"), for: .normal)
            isCheckedMon = false
            weekdays = weekdays.filter {$0 != 2}
        }
    }
    @IBOutlet var tuesdayOutlet: UIButton!
    @IBAction func tuesday(_ sender: Any) {
        if isCheckedTue == false {
            tuesdayOutlet.setImage(UIImage(named: "checked.png"), for: .normal)
            isCheckedTue = true
            weekdays.append(3)
        } else {
            tuesdayOutlet.setImage(UIImage(named: "box.png"), for: .normal)
            isCheckedTue = false
            weekdays = weekdays.filter {$0 != 3}
        }
    }
    @IBOutlet var wednesdayOutlet: UIButton!
    @IBAction func wednesday(_ sender: Any) {
        if isCheckedWed == false {
            wednesdayOutlet.setImage(UIImage(named: "checked.png"), for: .normal)
            isCheckedWed = true
            weekdays.append(4)
        } else {
            wednesdayOutlet.setImage(UIImage(named: "box.png"), for: .normal)
            isCheckedWed = false
            weekdays = weekdays.filter {$0 != 4}
        }
    }
    @IBOutlet var thursdayOutlet: UIButton!
    @IBAction func thursday(_ sender: Any) {
        if isCheckedThu == false {
            thursdayOutlet.setImage(UIImage(named: "checked.png"), for: .normal)
            isCheckedThu = true
            weekdays.append(5)
        } else {
            thursdayOutlet.setImage(UIImage(named: "box.png"), for: .normal)
            isCheckedThu = false
            weekdays = weekdays.filter {$0 != 5}
        }
    }
    @IBOutlet var fridayOutlet: UIButton!
    @IBAction func friday(_ sender: Any) {
        if isCheckedFri == false {
            fridayOutlet.setImage(UIImage(named: "checked.png"), for: .normal)
            isCheckedFri = true
            weekdays.append(6)
        } else {
            fridayOutlet.setImage(UIImage(named: "box.png"), for: .normal)
            isCheckedFri = false
            weekdays = weekdays.filter {$0 != 6}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
//        HomeViewController().createNotifications(usingClass: Class)
    }
    
    func checkInputs() -> Bool {
        if let _ = selectedTime {
            if let _ = inputCourseName {
                if let _ = selectedLocation {
                    if !weekdays.isEmpty {
                        return true
                    }
                }
            }
        }
        return false
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
        
        // error handling
        if checkInputs() {
            // grab time user selected as class start
            var hour: Int = 0
            var minute: Int = 0
            if let time = selectedTime {
                let components = Calendar.current.dateComponents([.hour, .minute], from: time)
                hour = components.hour!
                minute = components.minute!
            }
           
            // iterates through days user selected and creates notifications
            for days in weekdays {
                print(days)
                var components = DateComponents()
                components.hour = hour
                components.minute = minute
                components.weekday = days
                components.weekdayOrdinal = 10
                components.timeZone = .current
                let calendar = Calendar(identifier: .gregorian)
                let date = calendar.date(from: components)!

    //            let date = Date(timeIntervalSinceNow: 5)
                let content = UNMutableNotificationContent()
                content.title = inputCourseName.text!
                content.body = "\(inputCourseName.text!) is starting. Head to \(selectedLocation!)."
                content.sound = UNNotificationSound.default
                let triggerWeekly = Calendar.current.dateComponents([.weekday, .hour, .minute], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
                let identifier = "UYLLocalNotification"
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                center.add(request, withCompletionHandler: { (error) in
                    if error != nil {
                        print("error")
                    }
                })
            }
        } else {
            print("fill in all items")
        }
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
        locationInput.text = selectedLocation
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
