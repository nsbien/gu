//
//  ZagWebViewController.swift
//  GU
//
//  Created by Nicole Bien on 11/27/20.
//

import UIKit
import WebKit

class ZagWebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://sso.gonzaga.edu/authenticationendpoint/login.do?Name=PreLoginRequestProcessor&commonAuthCallerPath=%252Fcas%252Flogin&forceAuth=false&passiveAuth=false&service=https%3A%2F%2Fsso.gonzaga.edu%3A443%2Fssomanager%2Fc%2FSSB&tenantDomain=carbon.super&sessionDataKey=d0c3e649-42f1-4788-93e3-dd9853b8d7ea&relyingParty=Zagweb-OCI&type=cas&sp=Zagweb-OCI&isSaaSApp=false&authenticators=BasicAuthenticator:LOCAL")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}
