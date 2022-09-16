//
//  WebViewController.swift
//  bootcampOdev2
//
//  Created by Mehmet Mustafa Kılıç on 15.09.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL.init(string: "https://www.linkedin.com/in/mehmetmustafakilic/") {
            let urlRequest = URLRequest.init(url: url)
            webView.load(urlRequest)
            
        }
    }
}
