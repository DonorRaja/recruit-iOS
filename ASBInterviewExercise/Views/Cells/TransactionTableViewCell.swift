//
//  TransactionTableViewCell.swift
//  ASBInterviewExercise
//
//  Created by DonorRaja on 16/12/21.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionName: UILabel!
    
    @IBOutlet weak var transactionAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
