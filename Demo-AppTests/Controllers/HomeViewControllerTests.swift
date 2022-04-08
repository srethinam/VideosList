//
//  Demo_AppTests.swift
//  Demo-AppTests
//
//  Created by Saravanan Rethinam on 5/4/22.
//

import XCTest
@testable import Demo_App

class HomeViewControllerTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: HomeViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        storyboard = nil
        sut = nil
    }
    
    func testHomeViewController_WhenCreated_HasSeriesButtonAndAction() throws {
        let button: UIButton = try XCTUnwrap(sut.seriesButton, "Series button doesn't have referencing outlet")
        
        let seriesButtonActions = try XCTUnwrap(button.actions(forTarget: sut, forControlEvent: .touchUpInside), "Series button doesn't have any actions associtated to it")
        
        XCTAssertEqual(seriesButtonActions.count, 1)
        XCTAssertEqual(seriesButtonActions.first, "seriesButtonPressed:", "There is no action with a name seriesButtonPressed")
        
    }

    func testHomeViewController_WhenCreated_HasMoviesButtonAndAction() throws {
        let button: UIButton = try XCTUnwrap(sut.moviesButton, "Series button doesn't have referencing outlet")
        
        let moviesButtonActions = try XCTUnwrap(button.actions(forTarget: sut, forControlEvent: .touchUpInside), "Series button doesn't have any actions associtated to it")
        
        XCTAssertEqual(moviesButtonActions.count, 1)
        XCTAssertEqual(moviesButtonActions.first, "moviesButtonPressed:", "There is no action with a name seriesButtonPressed")
        
    }
}
