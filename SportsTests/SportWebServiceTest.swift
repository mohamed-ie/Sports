//
//  SportWebServiceTest.swift
//  SportsTests
//
//  Created by Mohamed Ibrahim on 11/05/2023.
//

import XCTest
@testable import Sports

final class SportWebServiceTest: XCTestCase {
    private var webservice : SportsWebservice!
    
    override func setUpWithError() throws {
        webservice = SportsWebserviceImpl()
    }

    override func tearDownWithError() throws {
      webservice = nil
    }

    func testFetchTeam() throws {
        //give
        let league = "football"
        let teamId = "6"
    
        //when
        let expectation = expectation(description: "Waiting for the API")
        webservice.fetchTeam(league: league, teamId: teamId,onComplete: { dto in
            guard let dto = dto else {
                XCTFail()
                expectation.fulfill()
                return
            }
            //then
            XCTAssertNotNil(dto.result,"Faild to load movies from api")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }

    func testFetchLeagues() throws {
        //give
        let league = "football"
    
        //when
        let expectation = expectation(description: "Waiting for the API")
        webservice.fetchLeagues(league: league, onComplete: { dto in
            guard let dto = dto else {
                XCTFail()
                expectation.fulfill()
                return
            }
            //then
            XCTAssertNotNil(dto.result,"Faild to load movies from api")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }
    
    func testFetchLives() throws {
        //give
        let league = "football"
        let leagueId = "49"
        
        //when
        let expectation = expectation(description: "Waiting for the API")
        webservice.fetchLives(league: league, leagueId: leagueId, onComplete: { (dto:AllSportsDto<FootballLive>?) in
            guard let dto = dto else {
                XCTFail("maybe no live in this league right now")
                expectation.fulfill()
                return
            }
            //then
            XCTAssertNotNil(dto.result,"Faild to load movies from api")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }

   
    func testFetchFixtures() throws {
        //give
        let league = "football"
        let leagueId = "49"
        let from = "2023-5-11"
        let to = "2023-5-26"
        
        //when
        let expectation = expectation(description: "Waiting for the API")
        webservice.fetchFixtures(league: league, leagueId: leagueId,from:from,to:to, onComplete: { (dto:AllSportsDto<FootballFixture>?) in
            guard let dto = dto else {
                XCTFail("maybe no live in this league right now")
                expectation.fulfill()
                return
            }
            //then
            XCTAssertNotNil(dto.result,"Faild to load movies from api")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }


}
