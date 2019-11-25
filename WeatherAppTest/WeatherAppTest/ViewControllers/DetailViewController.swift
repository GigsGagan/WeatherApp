//
//  DetailViewController.swift
//  WeatherAppTest
//
//  Created by gagan on 25/11/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailHumididtyLabel: UILabel!
    @IBOutlet weak var detailWeatherDesc: UILabel!
    @IBOutlet weak var detailImageView: CustomImageView!
    let loadinScreen = LoadingView.newInstance()

    let apiInstance = APIManager()
    var lat: String = ""
    var long: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadinScreen.show()
        apiInstance.getSearchDetailData(lat, long) { [weak self] (success, response, error) in
            
            if success {
                guard let response = response else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.updateUI(value: response)
                }
            }
        }
    }
    
    func updateUI(value: [WeatherDetails]) {
        
        loadinScreen.hide()
        
        if value.count > 0 {
            if let description = value[0].weatherDesc[0].value {
                detailWeatherDesc.text = description
            }
            
            if let humidity = value[0].humidity {
                detailHumididtyLabel.text = humidity
            }
            
            if let imageUrl = value[0].weatherIconUrl[0].value {
                detailImageView.loadImageUsingUrlString(imageUrl)
            }
        }
        
    }
    
    
}
