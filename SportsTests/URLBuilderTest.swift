//
//  SportsTests.swift
//  SportsTests
//
//  Created by Mohamed Ibrahim on 11/05/2023.
//

import XCTest
@testable import Sports

final class URLBuilderTest: XCTestCase {
    private var urlBuilder: URL.URLBuilder!
    private final let BASE_URL = "https://apiv2.allsportsapi.com/"    
    
    override func setUpWithError() throws {
        urlBuilder = URL.Builder(baseUrl: BASE_URL)
    }
    
    override func tearDownWithError() throws {
        urlBuilder = nil
    }
    
    
    func testNotNil() throws {
        //then
        XCTAssertNotNil(urlBuilder)
    }
    
    func testEndPoint() throws {
        //give
        let endPoint = "football"
        guard let url = urlBuilder.addEndPoint(endPoint: endPoint)
            .build() else {
            XCTFail("faile to build url")
            return
        }
        
        //when
        let result = url.absoluteString
        let expected = "\(BASE_URL)\(endPoint)"
        
        //then
        XCTAssertEqual(expected, result)
    }
    
    func testQueryParam() throws {
        //give
        let endPoint = "football"
        guard let url = urlBuilder.addEndPoint(endPoint: endPoint)
            .addQueryParam(param: "met", value: "Livescore")
            .addQueryParam(param: "leagueId", value: "22")
            .build() else {
            XCTFail("faile to build url")
            return
        }
        
        //when
        let result = url.absoluteString
        let expected = "\(BASE_URL)\(endPoint)?met=Livescore&leagueId=22"
        
        //then
        XCTAssertEqual(expected, result)
    }
    
    
}
