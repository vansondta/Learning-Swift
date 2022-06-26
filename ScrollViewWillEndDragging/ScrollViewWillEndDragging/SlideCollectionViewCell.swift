//
//  SlideCollectionViewCell.swift
//  ScrollViewWillEndDragging
//
//  Created by TheLightLove on 04/06/2022.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ withName: String) {
        imageView.image = UIImage(named: withName)
    }

}
