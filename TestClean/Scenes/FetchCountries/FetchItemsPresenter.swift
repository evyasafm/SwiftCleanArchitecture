//
//  FetchCountriesPresenter.swift
//   
//
//  Created by Evyasaf on 11/16/16.
//  Copyright © 2016 evya. All rights reserved.
//

import Foundation

protocol FetchItemsPresenter {
    
    func presentItems(countries: FetchCountries.Response)
    func presentError(error: Error)
    
}

class FetchCountriesPresenterHandler: FetchItemsPresenter {
 
    weak var view: FetchCountriesView?
    
    func presentItems(countries: FetchCountries.Response) {
        let countriesPM = countries.items.map { (itemModel: ItemModel) -> FetchCountries.ViewModel.ItemPM in
            return FetchCountries.ViewModel.ItemPM(name: itemModel.name ?? "", nativeName: itemModel.nativeName ?? "")
        }
        DispatchQueue.main.async {
            self.view?.displayCountries(countries: countriesPM)
        }
    }
    
    func presentError(error: Error) {
        DispatchQueue.main.async {
            self.view?.displayError(errorMessage: "Error")
        }
    }
    
}

