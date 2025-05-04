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
        let factsMock: [AppFact] = AppFact.sampleList
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

enum MockError: Error {
    case mock
}

class AppDataMock: AppDataProtocol {

    private(set) var setFactsCalledWithFacts: [AppFact]? // can be set only inside the mock
    private(set) var setCategoriesCalledWithCategories: [FactCategory]?
    var categories: [FactsApp.FactCategory] = []
    
    func setFacts(_ facts: [FactsApp.AppFact]) {
        setFactsCalledWithFacts = facts
    }
    
    func setCategories(_ categories: [FactsApp.FactCategory]) {
        setCategoriesCalledWithCategories = categories
    }
}

class FetcherMock: Fetchable {
    var errorMock: Error?
    var factsMock: [AppFact] = []
    var categoriesMock: [FactCategory] = []
    
    func fetchFacts(with categories: [FactsApp.FactCategory]) async throws -> [FactsApp.AppFact] {
        if let errorMock {
            throw errorMock
        }
        return factsMock
    }
    
    func fetchCategories() async throws -> [FactsApp.FactCategory] {
        if let errorMock {
            throw errorMock
        }
        return categoriesMock
    }
}
