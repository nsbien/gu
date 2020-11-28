//
//  ViewController.swift
//  GU
//
//  Created by Nicole Bien on 11/27/20.
//  Sources:
//      PENCIL ICON
//      <div>Icons made by <a href="https://www.flaticon.com/authors/those-icons" title="Those Icons">Those Icons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.30, green: 0.47, blue: 0.64, alpha: 1.00)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)]
    }
}

