//
//  journalEntryTableViewCell.swift
//  Journal
//
//  Created by Justin Snider on 11/2/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class journalEntryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
