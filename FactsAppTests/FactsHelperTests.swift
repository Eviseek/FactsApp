//
//  FactsHelperTests.swift
//  FactsAppTests
//
//  Created by Eva Chlpikova on 04.05.2025.
//

import Foundation

import XCTest
@testable import FactsApp

final class FactsHelperTests: XCTestCase {
    
    @MainActor func test_FactsHelper_loadCategoriesAndFetchFacts_shouldSetFacts() async throws {
        let appDataMock = AppDataMock()
        let fetcherMock = FetcherMock()
        var factsMock: [AppFact] = AppFact.sampleList
        fetcherMock.factsMock = factsMock
        let factsHelper = FactsHelper(appData: appDataMock, fetcher: fetcherMock)
        
        try await factsHelper.loadCategoriesAndFetchFacts()
        
        XCTAssertEqual(appDataMock.setFactsCalledWithFacts, factsMock)
    }
    
    @MainActor func test_FactsHelper_loadCategoriesAndFetchFacts_shouldThrowError() async {
        let appDataMock = AppDataMock()
        let fetcherMock = FetcherMock()
        fetcherMock.errorMock = MockError.mock
        let factsHelper = FactsHelper(appData: appDataMock, fetcher: fetcherMock)

        do {
            try await factsHelper.loadCategoriesAndFetchFacts()
            XCTFail("Should have failed.")
        } catch {
            XCTAssertNil(appDataMock.setFactsCalledWithFacts)
            XCTAssertEqual(MockError.mock, error as! MockError)
        }
        
    }

}

class AppDataMock: AppDataProtocol {
    private(set) var setFactsCalledWithFacts: [AppFact]? // can be set only inside the mock
    var categories: [FactsApp.FactCategory] = []
    
    func setFacts(_ facts: [FactsApp.AppFact]) {
        setFactsCalledWithFacts = facts
    }
}

enum MockError: Error {
    case mock
}


class FetcherMock: Fetchable {
    var errorMock: Error?
    var factsMock: [AppFact] = []
    
    func fetchFacts(with categories: [FactsApp.FactCategory]) async throws -> [FactsApp.AppFact] {
        if let errorMock {
            throw errorMock
        }
        return factsMock
    }
    
    func fetchCategories() async throws -> [FactsApp.FactCategory] {
        return [FactCategory]()
    }
}
