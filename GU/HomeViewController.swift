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

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.09, green: 0.30, blue: 0.45, alpha: 1.00)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)]
    }
}

