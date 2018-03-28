//
//  CountriesListConfigurator.swift
//   
//
//  Created by Evyasaf on 11/16/16.
//  Copyright © 2016 evya. All rights reserved.
//

import Foundation

class Configurator {
    
    static let shared: Configurator = { Configurator() }()
    
    // MARK: Configuration
    
    func configure(viewController: ViewController) {
        configureFetchCountries(viewController: viewController)
    }
    
    // Mark - Private methods
    
    private func configureFetchCountries(viewController: ViewController) {
        let router = Router()
        router.viewController = viewController
        
        let presenter = FetchCountriesPresenterHandler()
        presenter.view = viewController
        
        let interactor = FetchCountriesInteractorHandler()
        interactor.presenter = presenter
        
        viewController.fetchCountriesInteractor = interactor
        viewController.router = router
    }
    
}
