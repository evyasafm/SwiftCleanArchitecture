//
//  FetchCountriesInteractor.swift
//   
//
//  Created by Evyasaf on 11/16/16.
//  Copyright © 2016 evya. All rights reserved.
//

import Foundation
import RxSwift

protocol FetchCountriesInteractor {
    
    func fetchCountries()
    
}

class FetchCountriesInteractorHandler: FetchCountriesInteractor {
    
    var presenter: FetchItemsPresenter!
    
    private let networkService: NetworkClient
    private let bag = DisposeBag()
    
    init(countriesAPI: NetworkClient = NetworkClientHandler.shared) {
        self.networkService = countriesAPI        
    }
    
    func fetchCountries() {
        networkService
            .fetchItems()
            .subscribe(onNext: { (items: [ItemModel]) in
                self.presenter.presentItems(countries: FetchCountries.Response(items: items))
            }, onError: { (error: Error) in
                self.presenter.presentError(error: error)
            })
            .disposed(by: bag)
    }
    
}
