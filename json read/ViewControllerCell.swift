//
//  ViewControllerCell.swift
//  json read
//
//  Created by saud on 18/03/2019.
//  Copyright © 2019 Saud Alaameri. All rights reserved.
//

import UIKit

class ViewControllerCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autherLabel: UILabel!
    
    func configureCell (blog: BlogData) {
        titleLabel.text = blog.title
    }
    }


