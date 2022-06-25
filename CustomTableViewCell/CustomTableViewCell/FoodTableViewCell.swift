//
//  FoodTableViewCell.swift
//  CustomTableViewCell
//
//  Created by TheLightLove on 26/05/2022.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(_ item: foodItem) {
        foodImageView.image = UIImage(named: item.image)
        foodLabel.text = item.name
    }
}
