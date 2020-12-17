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

        let url = URL(string: "https://www.google.com/search?q=gonzaga+basketball&oq=gonzaga+ba&aqs=chrome.1.69i57j0i131i355i433i457j0j0i131i433j0j0i395i433j69i60j69i61.2992j1j4&sourceid=chrome&ie=UTF-8#sie=t;/m/03c_p38;3;/g/11ckvf54fz;mt;fp;1;;")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = false
    }
}





