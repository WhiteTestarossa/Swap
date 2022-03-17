//
//  ItemDetailViewController.swift
//  Swap
//
//  Created by Daniel Belokursky on 17.03.22.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValues()
        
    }
    
    //MARK: - Assign passed data
    func setupValues() {
        if let itemInfo = item {
            itemImageView.image = UIImage(named: itemInfo.image)
            itemNameLabel.text = itemInfo.name
            locationLabel.text = itemInfo.location
        }
    }
}
