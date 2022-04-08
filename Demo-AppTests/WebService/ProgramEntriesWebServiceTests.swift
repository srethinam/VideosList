//
//  ProgramEntriesWebServiceTests.swift
//  Demo-AppTests
//
//  Created by Saravanan Rethinam on 7/4/22.
//

import XCTest
@testable import Demo_App

class ProgramEntriesWebServiceTests: XCTestCase {
    
    let bundle = Bundle(for: ProgramsViewModel.self)
    var sut: ProgramEntriesWebService!
    var urlSession: URLSession!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockUrlProtocol.self]
        urlSession = URLSession(configuration: config)
        sut = ProgramEntriesWebService(urlString: ProgramsFeatureStrings.programEntriesUrl, urlSession: urlSession)

    }
    
    override func tearDown() {
        sut = nil
        MockUrlProtocol.stubResponseData = nil
        MockUrlProtocol.error = nil
    }
    
    func testProgramEntriesWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        
        MockUrlProtocol.stubResponseData = Data.jsonFromFile(fileName: "ProgramEntriesSuccess", bundle: bundle)
        let expectation = self.expectation(description: "Program Entries response expectation")
        
        sut.fetchProgramEntriesData { programs, _ in
            
            XCTAssertEqual(programs?.total, 10)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    func testProgramEntriesWebService_WhenReceiveDifferentResponse_Error() {
        
        MockUrlProtocol.stubResponseData = Data.jsonFromFile(fileName: "ProgramEntriesStructureError", bundle: bundle)
        let sut = ProgramEntriesWebService(urlString: ProgramsFeatureStrings.programEntriesUrl, urlSession: urlSession)
        
        let expectation = self.expectation(description: "Program Entries response expectation that contains a different JSON structure")
        sut.fetchProgramEntriesData { programs, error in
            XCTAssertNil(programs, "The response structure is not expected, so it should be nil")
            XCTAssertEqual(error, ProgramEntriesError.invalidResponseModel, "The method did not return expected response")

            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    func testProgramEntriesWebService_WhenEmptyUrlStringProvided_Error() {
        sut = ProgramEntriesWebService(urlString: "")
        let expectation = self.expectation(description: "Program Entries request Url is invalid")
        
        sut.fetchProgramEntriesData { programs, error in
            XCTAssertEqual(error, ProgramEntriesError.invalidRequestUrlString)
            XCTAssertNil(programs)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
}
