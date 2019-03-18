//
//  ViewController.swift
//  json read
//
//  Created by saud on 18/03/2019.
//  Copyright © 2019 Saud Alaameri. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tabelView: UITableView!
    
    var blogs = [BlogData] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        
        downloadData {
            print("Data is finshed")
        }
    }
    
    func downloadData(completed: @escaping () -> Void) {
        
        Alamofire.request(blogURL).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String,Any> {
                
                if let News = dict["News"] as? [Dictionary<String,Any>] {
                    
                    for new in News {
                        let p = BlogData(blog: new)
                        self.blogs.append(p)
                    }
                    
                    // For updating the UI
                    DispatchQueue.main.async {
                        self.tabelView.reloadData()
                    }
                    
                }
            }
            completed()
        }
    }
    
}

extension ViewController: UITableViewDataSource ,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ViewControllerCell {
            
            let blog = blogs[indexPath.row]
            cell.configureCell(blog: blog)
            return cell
            
        } else {
            return ViewControllerCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let blog = blogs[indexPath.row]
        guard let url = URL(string: blog.url) else { return }
        UIApplication.shared.open(url)
    }
    
}
