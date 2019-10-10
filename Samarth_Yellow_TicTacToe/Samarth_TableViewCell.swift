//
//  Samarth_TableViewCell.swift
//  Samarth_Yellow_TicTacToe
//
//  Created by Samarth Patel on 2019-05-29.
//  Copyright © 2019 Samarth Patel. All rights reserved.
//

import UIKit

class Samarth_TableViewCell: UITableViewCell {

    @IBOutlet weak var date_played: UILabel!
    @IBOutlet weak var who_won: UILabel!
    @IBOutlet weak var win_loss_image: UIImageView!
    
    var OrderOfMoves : [Int]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
