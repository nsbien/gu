//
//  ClassTableViewCell.swift
//  GU
//
//  Created by Kyle Pavey on 12/2/20.
//

import Foundation
import UIKit

class ClassTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func update(with classInfo: Class) {
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yyyy"
        //let startDateString = dateFormatter.string(from: classInfo.startDate!)
        //let endDateString = dateFormatter.string(from: classInfo.endDate!)
        //nameLabel.text = trip.destinationName
        //dateLabel.text = "\(startDateString)-\(endDateString)"
        //if let fileName = trip.imageFileName {
         //   let imageURL = FileManager.default.urls(for: .documentDirectory, in: //.userDomainMask).first!.appendingPathComponent(fileName)
          //  tripImageView.image = UIImage(contentsOfFile: imageURL.path)
       // }
    }
}
