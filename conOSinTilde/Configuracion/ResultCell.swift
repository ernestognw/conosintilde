//
//  ResultCell.swift
//  conOSinTilde
//
//  Created by Pamela on 25/05/21.
//

import UIKit

class ResultCell: UITableViewCell {
    
    @IBOutlet weak var juego: UILabel!
    @IBOutlet weak var puntos: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
