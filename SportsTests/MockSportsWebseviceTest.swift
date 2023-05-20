//
//  MockSportsWebseviceTest.swift
//  SportsTests
//
//  Created by Mohamed Ibrahim on 11/05/2023.
//

import XCTest
@testable import Sports

final class MockSportsWebseviceTest: XCTestCase {

    private var webservice : SportsWebservice!
    
    override func setUpWithError() throws {
        webservice = MockSportsWebservice()
    }

    override func tearDownWithError() throws {
        webservice = nil
    }

    func testTennisPlayers() throws {
        //give
        let league = "tennis"
        let leagueId = "2833"
        
        //when
        webservice.fetchTennisPlayers(league: league, leagueId: leagueId, onComplete:{(dto:AllSportsDto<TennisPlayer>?) in
            guard let dto = dto else {
                XCTFail()
                return
            }
            //then
            XCTAssertNotNil(dto.result,"Faild to load movies from api")
        })
        
    }
    
    func testTeams() throws {
        //give
        let league = "football"
        let leagueId = "22"
        
        //when
        webservice.fetchTeams(league: league, leagueId: leagueId, onComplete:{(dto:AllSportsDto<Team>?) in
            guard let dto = dto else {
                XCTFail()
                return
            }
            //then
            XCTAssertNotNil(dto.result,"Faild to load movies from api")
        })
        
    }

    func testPerformanceExample() throws {
       
    }

}
