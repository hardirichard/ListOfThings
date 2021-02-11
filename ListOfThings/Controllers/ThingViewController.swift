//
//  ThingViewController.swift
//  ListOfThings
//
//  Created by Richárd Hardi on 2021. 02. 09..
//

import Foundation
import UIKit
import RxSwift
import RxCocoa



class ThingViewController: UIViewController, ListOfThingsDelegate {
    
    

    func didTapCell(item: Item) {
        
        
        print(item.title)
        view.backgroundColor = .systemBackground
        self.titleLabel.text = item.title
        self.picture.load(url: URL(string: item.url)!)
    }
    
    
//    var titleText: String!
//    var urlText: String!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}
