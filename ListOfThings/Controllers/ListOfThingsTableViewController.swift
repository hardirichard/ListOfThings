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
    
//    let disposeBag = DisposeBag()
    private var thingListVM: ThingListViewModel!
//
//    private let selectedItemSubject = PublishSubject<Item>()
//    var selectedItem: Observable<Item> {
//        return selectedItemSubject.asObservable()
//    }
    
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
        
        cell.titleLabel.text = item.title
        cell.thumbnailImage.load(url: URL(string: item.thumbnailUrl)!)
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedItem = items[indexPath.row]
        
        let destinationVC = storyboard?.instantiateViewController(identifier: "ThingViewController") as! ThingViewController
        self.delegate = destinationVC
        
        
        delegate.didTapCell(item: selectedItem)
        
//        let nav = UINavigationController(rootViewController: self)
//        UIApplication.shared.keyWindow?.rootViewController = nav
//        nav.pushViewController(destinationVC, animated: true)
//
//        self.navigationController?.pushViewController(destinationVC, animated: true)
        show(destinationVC, sender: self)
        //present(destinationVC, animated: true, completion: nil)

        //self.performSegue(withIdentifier: "SegueToItem", sender: self)
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