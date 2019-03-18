//
//  BlogData.swift
//  json read
//
//  Created by saud on 18/03/2019.
//  Copyright © 2019 Saud Alaameri. All rights reserved.
//

import Foundation


class BlogData {
    private var _title :String!
    private var _author :String!
    private var _url:String!
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
//
//    var author: String {
//        if _author == nil {
//            _author = ""
//        }
//        return _author
//
//    }
    
    var url: String {
        if _url == nil {
            _url = ""
        }
        return _url
        
    }
    init(blog:Dictionary<String , Any>) {
        if let t = blog["title"] as? String{
            self._title = t
        }
//        if let a = blog["author"] as? String{
//            self._author = a
//        }
        if let u = blog["url"] as? String{
            self._url = u
        }
    }
}
