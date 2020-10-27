//
//  OperationMapCell.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import UIKit
import Kingfisher

class OperationMapCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(image: OperationImage) {
        if let urlStr = image.url, let url = URL(string: urlStr) {
            imageView.kf.setImage(with: url)
        }
    }
}
