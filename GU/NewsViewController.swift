//
//  NewsViewController.swift
//  GU
//
//  Created by Nicole Bien on 12/16/20.
//

import UIKit
import WebKit

class NewsViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.gonzaga.edu/news-events")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
