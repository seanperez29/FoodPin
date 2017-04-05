//
//  WebViewController.swift
//  FoodPin
//
//  Created by Sean Perez on 4/4/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://www.appcoda.com/contact") {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }

}
