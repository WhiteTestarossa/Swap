//
//  ItemTableViewCell.swift
//  Swap
//
//  Created by Daniel Belokursky on 16.03.22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        roundImageViewCorners(imageView: itemImage)
    }
    
    //MARK: - Making image corners rounded
    func roundImageViewCorners(imageView: UIImageView) {
        imageView.layer.cornerRadius = 20.0
        imageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
