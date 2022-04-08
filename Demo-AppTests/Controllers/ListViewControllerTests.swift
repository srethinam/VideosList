//
//  ListViewControllerTests.swift
//  Demo-AppTests
//
//  Created by Saravanan Rethinam on 8/4/22.
//

import XCTest
@testable import Demo_App

class ListViewControllerTests: XCTestCase {
    
    let bundle = Bundle(for: ProgramsViewModel.self)
    var sut: ListViewController!
    
    override func setUp() {
        sut = ListViewController()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testListViewController_WhenViewDidLoad_CollectionViewNotNil() {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.programCollectionView)
    }

    func testListViewController_WhenDataAvailable_CheckProgramEntriesModel() {
        
        let jsonFileName = "ProgramEntriesSuccess"
        let data = Data.jsonFromFile(fileName: jsonFileName, bundle: bundle)
        sut.viewDidLoad()
        
        let decoder = JSONDecoder()
        do {
            let entriesdata = try decoder.decode(Programs.self, from: data)

            sut.programViewModel.programData = entriesdata
            XCTAssertNotNil(sut.programViewModel.programData, "Program entries data not set in view model")
        } catch {
            XCTAssert(false, "\(error)")
        }
    }

}

