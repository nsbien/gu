//
//  BlackBoardViewController.swift
//  GU
//
//  Created by Nicole Bien on 11/27/20.
//

import UIKit
import WebKit

class BlackBoardViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://learn.gonzaga.edu")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}
