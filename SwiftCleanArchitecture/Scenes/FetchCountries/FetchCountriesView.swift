//
//  FetchCountriesView.swift
//   
//
//  Created by Evyasaf on 11/16/16.
//  Copyright © 2016 evya. All rights reserved.
//

import Foundation

protocol FetchCountriesView: class {
    
    func displayCountries(countries: [FetchCountries.ViewModel.ItemPM])
    func displayError(errorMessage: String)
    
}
