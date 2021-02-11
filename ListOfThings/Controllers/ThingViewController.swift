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
        
        self.tempText = item.title
        self.tempPictureURL = item.url
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    var tempText: String!
    var tempPictureURL: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    func updateUI() {
        titleLabel.text = tempText
        picture.load(url: URL(string: tempPictureURL)!)
    }
}
