//
//  ViewController.swift
//  TestClean
//
//  Created by Evyasaf on 3/11/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var router: Router!
    var fetchCountriesInteractor: FetchCountriesInteractor!
    
    // Mark - Private properties
    
    fileprivate var countries = [FetchCountries.ViewModel.ItemPM]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Configurator.shared.configure(viewController: self)
        fetchCountriesInteractor.fetchCountries()
        [MyTableViewCell.self].forEach(tableView.register)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.self.reuseID) as! MyTableViewCell
        cell.itemLabel.text = countries[indexPath.row].name
        return cell
    }
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        fetchCountriesInteractor.fetchCountries()
    }
    
}

extension ViewController: FetchCountriesView {
    
    func displayCountries(countries: [FetchCountries.ViewModel.ItemPM]) {
        self.countries = countries
        print("D-O-N-E")
    }
    
    func displayError(errorMessage: String) {
        print("E-R-R-O-R")
    }
    
}
