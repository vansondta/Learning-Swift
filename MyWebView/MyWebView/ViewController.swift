//
//  ViewController.swift
//  MyWebView
//
//  Created by TheLightLove on 26/05/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        
        let urlString = "http://google.com/"
        let url = URL(string: urlString)
        
        let requestUrl = URLRequest(url: url!)
        myWebView.load(requestUrl)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        myWebView.goBack()
        checkButton()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        myWebView.goForward()
        checkButton()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        checkButton()
    }
    
    func checkButton() {
        if myWebView.canGoBack {
            backButton.isEnabled = true
        } else {
            backButton.isEnabled = false
        }
        
        if myWebView.canGoForward {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
}
