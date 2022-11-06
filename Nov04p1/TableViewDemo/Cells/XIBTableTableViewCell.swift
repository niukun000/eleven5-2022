//
//  XIBTableTableViewCell.swift
//  Nov04p1
//
//  Created by Kun Niu on 11/4/22.
//

import UIKit

class XIBTableTableViewCell: UITableViewCell {

    @IBOutlet weak var demoImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    func configure(imageName: String, dogName: String?) {
        self.demoImageView.image = UIImage(named: dogName ?? "JINX")
        self.bottomLabel.text = dogName
         self.topLabel.text = "50"
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value * 100)
        self.topLabel.text = "\(value)"
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
