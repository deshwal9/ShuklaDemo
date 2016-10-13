//
//  WorkoutTableViewCell.swift
//  SportFit
//
//  Created by Ashish Pal on 01/10/16.
//
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var statusBtn: UIButton!
    
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var exerciseLbl: UILabel!
    @IBOutlet weak var setLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
