//
//  ThingsViewModel.swift
//  ListOfThings
//
//  Created by Richárd Hardi on 2021. 02. 10..
//

import Foundation
import RxSwift
import RxCocoa

struct ThingListViewModel {
    let thingsVM: [ThingViewModel]
    
}

extension ThingListViewModel {
    init(_ things: [Item]) {
        self.thingsVM = things.compactMap(ThingViewModel.init)
    }
}

extension ThingListViewModel {
    
    func thingAt(_ index: Int) -> ThingViewModel {
        return self.thingsVM[index]
    }
}


struct ThingViewModel {
    let item: Item
    
    init(_ item: Item) {
        self.item = item
    }
}

extension ThingViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(item.title)
    }
    
    var thumbnail: Observable<String> {
        return Observable<String>.just(item.thumbnailUrl)
    }
    
    var url: Observable<String> {
        return Observable<String>.just(item.url)
    }
}
