//
//  SecondViewController.swift
//  json read
//
//  Created by saud on 18/03/2019.
//  Copyright © 2019 Saud Alaameri. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var blog : BlogData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBlog()
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func loadBlog () {
    let urlString = URL (string: blogURL)
        let request = URLRequest(url:urlString!)
        webView.loadRequest(request)
    }

}
