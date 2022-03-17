//
//  HomeTableViewController.swift
//  Swap
//
//  Created by Daniel Belokursky on 16.03.22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    lazy var dataSource = configureDataSource()
    
    var items: [Item] = [
        Item(name: "Cafe Deadend", location:"Hong Kong", image: "cafedeadend"),
        Item(name: "Homei", location: "Hong Kong", image:"homei"),
        Item(name: "Teakha", location: "Hong Kong", image: "teakha"),
        Item(name: "Cafe loisl", location: "Hong Kong", image: "cafeloisl"),
        Item(name: "Petite Oyster", location: "Hong Kong" , image: "petiteoyster"),
        Item(name: "For Kee Item", location: "HongKong", image: "forkee"),
        Item(name: "Po's Atelier", location: "Hong Kong", image: "posatelier"),
        Item(name: "Bourke Street Backery", location:"Sydney", image: "bourkestreetbakery"),
        Item(name: "Haigh's Chocolate", location: "Sydney", image: "haigh"),
        Item(name: "Palomino Espresso", location: "Sydney", image: "palomino"),
        Item(name: "Upstate", location: "New York", image: "upstate"),
        Item(name: "Traif", location: "New York", image: "traif"),
        Item(name: "Graham Avenue Meats", location: "New York", image: "graham"),
        Item(name: "Waffle & Wolf", location: "NewYork", image: "waffleandwolf"),
        Item(name: "Five Leaves", location: "New York", image: "fiveleaves"),
        Item(name: "Cafe Lore", location: "New York", image: "cafelore"),
        Item(name: "Confessional", location: "New York", image: "confessional"),
        Item(name: "Barrafina", location: "London", image: "barrafina"),
        Item(name: "Donostia", location: "London", image: "donostia"),
        Item(name: "Royal Oak", location: "London", image: "royaloak"),
        Item(name: "CASK Pub and Kitchen", location: "London", image: "cask")
    ]
    
    enum Section {
        case all
    }
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = dataSource
        applySnapshot()
        
        //For iPad
        //tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit() //Actually changing Title
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ItemDetailViewController
                destinationController.item = items[indexPath.row]
            }
        }
    }

    // MARK: - UITableView Diffable Data Source
    // MARK: Creating object to manage data and provide cells for tableView
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Item> {
        let cellIdentifier = "dataCell"
        let dataSource = UITableViewDiffableDataSource<Section, Item>(tableView: self.tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
            cell.itemNameLabel.text = item.name
            cell.locationLabel.text = item.location
            cell.itemImage.image = UIImage(named: item.image)
            return cell
        }
        return dataSource
    }
    
    //MARK: Apply changes
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([Section.all])
        snapshot.appendItems(items, toSection: Section.all)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
