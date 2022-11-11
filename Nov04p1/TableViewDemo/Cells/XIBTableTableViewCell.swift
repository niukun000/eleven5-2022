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
    
    @IBOutlet weak var slideBar: UISlider!
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
    @IBAction func addSlide(_ sender: UIButton) {
        self.slideBar.value = 0.5
        self.topLabel.text = "50"
        self.topLabel.textColor = UIColor(red: 100, green: 5, blue: 5, alpha: 100)
    }

    
}
