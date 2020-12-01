//
//  HomeViewController.swift
//  GU
//
//  Created by Nicole Bien on 11/27/20.
//  Sources:
//      PENCIL ICON
//      <div>Icons made by <a href="https://www.flaticon.com/authors/those-icons" title="Those Icons">Those Icons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
//  OUTLOOK ICON
//  SCHEDULE ADD
//  <div>Icons made by <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
//  ZAGWEB ICON
//  <div>Icons made by <a href="https://www.flaticon.com/authors/prosymbols" title="Prosymbols">Prosymbols</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.09, green: 0.30, blue: 0.45, alpha: 1.00)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)]
        
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
            let date = Date(timeIntervalSinceNow: 10)
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
                 // Something went wrong
             }
         })
        //}
        
    }

}

