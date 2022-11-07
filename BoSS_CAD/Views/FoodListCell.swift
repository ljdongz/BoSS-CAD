//
//  FoodListCell.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/11/07.
//

import UIKit

class FoodListCell: UITableViewCell {

    @IBOutlet weak var nameLabelText: UILabel!
    @IBOutlet weak var kcalLabelText: UILabel!
    @IBOutlet weak var sizeLabelText: UILabel!
    @IBOutlet weak var carbohydrateLabelText: UILabel!
    @IBOutlet weak var proteinLabelText: UILabel!
    @IBOutlet weak var fatLabelText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
