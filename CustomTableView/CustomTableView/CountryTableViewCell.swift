//
//  CountryTableViewCell.swift
//  CustomTableView
//
//  Created by TheLightLove on 19/05/2022.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var countryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryImage.layer.cornerRadius = countryImage.layer.frame.height / 2
        countryView.layer.cornerRadius = countryView.layer.frame.height / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func countryCell(_ country: String) {
        countryImage.image = UIImage(named: country)
        countryLable.text = country
    }

}
