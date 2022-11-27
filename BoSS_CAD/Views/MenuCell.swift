//
//  MenuCell.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/11/02.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var mealTimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
