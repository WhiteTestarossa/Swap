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
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValues()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: Title
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = item?.name
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
