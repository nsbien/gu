//
//  EmergencyViewController.swift
//  GU
//
//  Created by Nicole Bien on 12/16/20.
//

import UIKit
import Foundation

class EmergencyViewController: UIViewController {

    let securityNumber = "5093132222"
    let healthCounselingNumber = "5093134066"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func callCampusSecurity(_ sender: Any) {
        guard let url = URL(string: "tel://\(securityNumber)"),
                    UIApplication.shared.canOpenURL(url) else { return }
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
    }


    @IBAction func callHealthCounseling(_ sender: Any) {
        guard let url = URL(string: "tel://\(healthCounselingNumber)"),
                    UIApplication.shared.canOpenURL(url) else { return }
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
    }

}
