//
//  DiningViewController.swift
//  GU
//
//  Created by Nicole Bien on 12/16/20.
//

import UIKit
import WebKit

class DiningViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://zagdining.sodexomyway.com/dining-near-me/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
