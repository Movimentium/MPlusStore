//
//  PostVC.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit
import WebKit

class PostVC: UIViewController, WKUIDelegate {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var vwToWebVw: UIView!

    var webView: WKWebView!
    
    
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if post == nil {
            return
        }
        navBar.topItem?.title = post.title
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        vwToWebVw = webView
        webView.loadHTMLString(post.content, baseURL: nil)
    }
    
    // MARK: - WKNavigationDelegate

//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//
//    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//
//    }
    

    // MARK: - IBActions
    
    @IBAction func onBtnClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
 

}
