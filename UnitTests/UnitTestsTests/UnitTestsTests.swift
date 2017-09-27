//
//  UnitTestsTests.swift
//  UnitTestsTests
//
//  Created by Badarinath Venkatnarayansetty on 9/26/17.
//  Copyright © 2017 Badarinath Venkatnarayansetty. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import UnitTests  // indicates the project target we are testing.


class UnitTestsTests: QuickSpec {
    
    override func spec() {
        
        var subject: MovieTableViewController!
        
        describe("MovieTableViewControllerSpec"){
            
            //beforeEach runs before every example is executed in describe closure.
            beforeEach {
                
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieTableViewController") as! MovieTableViewController
                
                _ = subject.view  //puts the view controller into the memeory , it's calling viewDidLoad
            
            }
            
            context("When View is loaded"){
                it("should have 8 movies loaded"){
                    expect(subject.tableView.numberOfRows(inSection: 0)).to(equal(8))
                    expect(subject.tableView.numberOfSections).to(equal(1))
                }
            }
            
            
            context("Table View"){
                var cell: MovieCell!
                
                
                beforeEach{
                    cell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? MovieCell
                }
                
                it("should show movie Title and genre") {
                    expect(cell.titleLabel?.text).to(equal("The Emoji Movie"))
                    expect(cell.subTitleLabel?.text).to(equal("Animation"))
                }
                
                
            }
            
            
            
        }
    
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
            
        }
    }
    
}
