//
//  HomeTableViewController.swift
//  Swap
//
//  Created by Daniel Belokursky on 16.03.22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    lazy var dataSource = configureDataSource()
    
    var itemNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery"
    , "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var itemsImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var itemLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    enum Section {
        case all
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = dataSource
        applySnapshot()
        
        //For iPad
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK:- Table view data source
    // MARK: Creating object to manage data and provide cells for tableView
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "dataCell"
        let dataSource = UITableViewDiffableDataSource<Section, String>(tableView: self.tableView) { tableView, indexPath, itemName in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
            cell.itemNameLabel.text = itemName
            cell.locationLabel.text = self.itemLocations[indexPath.row]
            cell.itemImage.image = UIImage(named: self.itemsImages[indexPath.row])
            return cell
        }
        return dataSource
    }
    
    //MARK: Apply changes
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([Section.all])
        snapshot.appendItems(itemNames, toSection: Section.all)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
