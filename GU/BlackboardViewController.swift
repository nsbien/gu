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

        let url = URL(string: "https://login.microsoftonline.com/2ba33407-5ccc-4940-bd16-ae154f04c3ca/saml2?SAMLRequest=fVLBTuMwEP0Vy3cntuNCsZqi7iK0SCAqEvawN8edpq4Su%2BtxqhVfT0gLyx6Wi6WR35s3894srv%2F0HTlCRBd8SUXGKQFvw8b5tqTP9S2b0%2BvlAk3fyYNeDWnnn%2BD3AJjISPSoTz8lHaLXwaBD7U0PqJPV1erhXsuM60MMKdjQUbJChJhGqe%2FB49BDrCAenYXnp%2FuS7lI6oM7zDkz0WRv8i2lNBpshN6Mue1PKp6eqHim5GWdw3qRp7g9qaJ3PemdjwLBNwXfOQ2ZDn8vGFIXil2xmrWXqSnHWbMQFMyBmasuVLayZuktKbkO0MO1a0q3pECi5uymp2bfzecsLvjeFbIQSl8VVI7bCzffKbkYMrg2iO8JfFuIAdx6T8amkkkvOhGSC1%2FxC85kWMpsp9YuS9dmgb86fjP%2FKzeYEQv2jrtds%2FVjVlPx8D3AE0HNcelKPn3P6urF5D4cu%2Fx8F7lzThA7SbpF%2Fllmey3%2BPZPkK&SigAlg=http%3A%2F%2Fwww.w3.org%2F2001%2F04%2Fxmldsig-more%23rsa-sha256&Signature=a3FGagvEKI4lhWL5bNVp%2FWlQbmKYmJOCCD2uy%2Bj7Cvn17Y5e%2FHvuwhvIbelB%2F8qeGO76eH4ePhsyvU5qnW4UqxPaN1AT9AaYA8p8%2Bl4r9AZa9wnRsFcKv9DlMijbE8Cjpw7ivMeGNoSdRImj3b48oLbiVou3QOHPP3bt0lkaaDAM1pgS8mxXdxQidj6Q%2FrjN7wLk8sZug4RoMQ1wZr9g5MrgdmkaL1Fs7%2BUYTruilzPTY6sk0hM7ZH8iMo3TwJNGMD%2B1BTa0bmzc3DRag6ggNX2Qj7RdLBb2ZbRibbIC%2FY2RkQpUjXXDytee2guHkr6o4h4EplLr5yHt6ETFcg1%2BiA%3D%3D")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
