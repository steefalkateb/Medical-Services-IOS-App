//
//  AppointmentsTableViewCell.swift
//  Alwadi
//
//  Created by MacBookPro on 1/5/22.
//

import UIKit

class AppointmentsTableViewCell: UITableViewCell {

 
    
    
    @IBOutlet weak var datelable:UILabel!
    @IBOutlet weak var timelable:UILabel!

    @IBOutlet weak var servicelable:UILabel!
    @IBOutlet weak var doctorlable:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
