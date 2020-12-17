//
//  SportsViewController.swift
//  GU
//
//  Created by Kyle Pavey on 12/16/20.
//
import UIKit
import WebKit

class SportsViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://gozags.com/calendar?date=12/16/2020&vtype=list")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = false
    }
}





