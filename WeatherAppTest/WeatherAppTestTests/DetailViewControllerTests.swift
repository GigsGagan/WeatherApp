//
//  DetailViewControllerTests.swift
//  WeatherAppTest
//
//  Created by gagan on 25/11/19.
//  Copyright © 2019 Gaganpreet Singh. All rights reserved.
//

import XCTest
@testable import WeatherAppTest

class DetailViewControllerTests: XCTestCase {
    
    var instance = DetailViewController()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        instance = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //load view hierarchy
        _ = instance.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSUT_CanInstantiateViewController() {
        
        XCTAssertNotNil(instance)
        XCTAssertNotNil(instance.viewDidLoad())
        XCTAssertNotNil(instance.viewWillAppear(true))
        XCTAssertNotNil(instance.loadinScreen)
        XCTAssertNotNil(instance.updateUI(value: []))
        XCTAssertNotNil(instance.loadinScreen)
        XCTAssertNotNil(instance.detailImageView.loadImageUsingUrlString("acb"))

   

    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
}
