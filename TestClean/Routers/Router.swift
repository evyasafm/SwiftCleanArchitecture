//
//  AllCountriesRouter.swift
//   
//
//  Created by Evyasaf on 11/16/16.
//  Copyright © 2016 evya. All rights reserved.
//

import UIKit

extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
    
}

class Router {
    
    weak var viewController: ViewController!
    
    // MARK: Navigation
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        if segue.identifier == "CountriesToCountryBordersSegue" {
            passDataToCountryBordersListViewController(segue: segue)
        }
    }
    
    func passDataToCountryBordersListViewController(segue: UIStoryboardSegue) {
//        if let selectedIndexPath = viewController.tableView.indexPathForSelectedRow {
//            let selectedCountry = viewController.countries[selectedIndexPath.row] as! CountrysBordersPresentationModel
//            let countryBordersListViewController = segue.destination as! CountryBordersListViewController
//            countryBordersListViewController.fetchCountryBordersInteractorArgs = selectedCountry.fetchCountryBordersInteractorArgs
//            countryBordersListViewController.title = selectedCountry.name
//        }
    }

}
