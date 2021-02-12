//
//  ListOfThingsTableViewController.swift
//  ListOfThings
//
//  Created by Richárd Hardi on 2021. 02. 09..
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa

protocol ListOfThingsDelegate {
    func didTapCell(item: Item)
}

class ListOfThingsTableViewController: UITableViewController {
    
    var delegate: ListOfThingsDelegate!
    
    private var thingListVM: ThingListViewModel!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fetchData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThingCell", for: indexPath) as? ListOfThingsTableViewCell else { fatalError("ThingCell is not found")}
        
        let item = items[indexPath.row]
        
        cell.titleLabel.text = item.title.capitalizingFirstLetter()
        
        cell.thumbnailImage.load(url: URL(string: item.thumbnailUrl)!)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = items[indexPath.row]
        
        let destinationVC = storyboard?.instantiateViewController(identifier: "ThingViewController") as! ThingViewController
        self.delegate = destinationVC
        delegate.didTapCell(item: selectedItem)
        
        show(destinationVC, sender: self)
    }
}


extension ListOfThingsTableViewController {
    
    private func fetchData() {

        let url = "https://jsonplaceholder.typicode.com/photos"
        
        AF.request(url).responseDecodable(of: [Item].self) { (response) in
          guard let items = response.value else { return print("data did not come") }
            
            self.items = items
            
            self.tableView.reloadData()
        }
    }
}
