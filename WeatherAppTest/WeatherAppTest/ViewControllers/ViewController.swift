//
//  ViewController.swift
//  WeatherAppTest
//
//  Created by gagan on 25/11/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let apiInstance = APIManager()
    let loadinScreen = LoadingView.newInstance()
    let defaults = UserDefaults.standard
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellIdentifier = "cell"
    let defaultsKey = "SavedArray"
    var loadUsedValues = false
    var dataArray = [Details]()
    var usedArray = [String]()
    
    //MARK:- App Life Cycle Methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        if let detail = defaults.array(forKey: defaultsKey) as? [String]  {
            self.navigationItem.title = "Recently searched"
            loadUsedValues = true
            usedArray = detail.reversed()
            tableView.reloadData()
        }
    }
    
}

//MARK:- UITableView Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loadUsedValues {
            return usedArray.count
        }
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if loadUsedValues {
            cell.textLabel?.text = usedArray[indexPath.row]
        } else {
            
            if dataArray.count > 0, dataArray[indexPath.row].areaName.count > 0 {
                if let name = dataArray[indexPath.row].areaName[0].value {
                    cell.textLabel?.text = name
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !loadUsedValues &&  !dataArray.isEmpty {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            if let name = dataArray[indexPath.row].areaName[0].value {
                let selectedCity = name
                updateViewedCity(selectedCity)
                
                detailViewController.lat = dataArray[indexPath.row].latitude!
                detailViewController.long = dataArray[indexPath.row].longitude!
            }
            self.navigationController?.pushViewController(detailViewController, animated: true)
            
        } else {
            loadinScreen.show()
            getWeatherData(enteredValue: usedArray[indexPath.row])
        }
        
    }
}

//MARK:- Private Methods
extension ViewController {
    
    func updateViewedCity(_ value: String) {
        
        if let detail = defaults.array(forKey: defaultsKey) as? [String]  {
            var lastEnteredValue:[String] = detail
            lastEnteredValue.append(value)
            if lastEnteredValue.count < 10 {
                defaults.set(lastEnteredValue, forKey: defaultsKey)
            }
        } else {
            let newArray:[String] = [value]
            defaults.set(newArray, forKey: defaultsKey)
        }
    }
    
}

//MARK:- Searching Methods
extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let text = searchController.searchBar.text, !text.isEmpty {
            getWeatherData(enteredValue: text)
        }
    }
    
    func getWeatherData(enteredValue: String) {
        
        self.navigationItem.title = "Home"
        let newString = enteredValue.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        apiInstance.getSearchData(newString) { [weak self] (success, response, error) in
            
            self?.loadUsedValues = false
            if !(self?.dataArray.isEmpty)! {
                self?.dataArray.removeAll()
            }
            guard let response = response else { return }
            for value in response {
                self?.dataArray.append(value)
            }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.loadinScreen.hide()
            }
        }
    }
    
}

