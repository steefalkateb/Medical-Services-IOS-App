//
//  CustTableViewCell.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class CustTableViewCell: UITableViewCell {

    
    @IBOutlet weak var namelable:UILabel!
    @IBOutlet weak var desclable:UILabel!
    @IBOutlet  weak var imgview: UIImageView!

    @IBOutlet weak var desctwo:UITextView!
    @IBOutlet weak var specialtylable:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
