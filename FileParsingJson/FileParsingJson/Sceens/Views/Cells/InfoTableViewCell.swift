//
//  InfoTableViewCell.swift
//  FileParsingJson
//
//  Created by TheLightLove on 05/06/2022.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getData(_ user: UserModel) {
        nameLabel.text = "Full name: \(user.firth_Name) \(user.last_Name)"
        genderLabel.text = user.gender == true ? "Gender: Male" : "Gender: Female"
        ageLabel.text = "Age: \(user.age)"
    }
    
}
