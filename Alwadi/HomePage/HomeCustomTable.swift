//
//  HomeCustomTable.swift
//  Alwadi
//
//  Created by MacBookPro on 12/2/21.
//

import UIKit

class HomeCustomTable: UITableViewCell {
    @IBOutlet weak var nemelable:UILabel!
//    @IBOutlet  weak var imgview: UIImageView!
        @IBOutlet  weak var imgview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
