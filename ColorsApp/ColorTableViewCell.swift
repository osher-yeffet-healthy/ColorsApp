//
//  ColorTableViewCell.swift
//  ColorsApp
//
//  Created by Osher Yeffet on 01/06/2022.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorDescriptionLabel: UILabel!
    @IBOutlet weak var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
