//
//  FactsFetcherTests.swift
//  FactsAppTests
//
//  Created by Eva Chlpikova on 04.05.2025.
//

import XCTest
@testable import FactsApp

final class FactsFetcherTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_FactsFetcher_fetchFacts_shouldReturnFacts() async throws {
        let firestoreFetchableMock = FirestoreFetchableMock()
        let factsFetcher = FactsFetcher(firestoreService: firestoreFetchableMock)
        let mockCategories = FactCategory.sampleList
        
        let result = try await factsFetcher.fetchFacts(with: mockCategories)
        
        XCTAssertTrue(firestoreFetchableMock.fetchFactsCalled)
    }

    func test_FactsFetcher_fetchFacts_shouldThrowError() async throws {
        let firestoreFetchableMock = FirestoreFetchableMock()
        let factsFetcher = FactsFetcher(firestoreService: firestoreFetchableMock)
        let mockCategories = FactCategory.sampleList
        let mockError = MockError.mock
        firestoreFetchableMock.mockError = mockError
        
        do {
            let _ = try await factsFetcher.fetchFacts(with: mockCategories)
            XCTFail("Should have failed.")
        } catch {
            XCTAssertEqual(MockError.mock, error as! MockError)
        }
    }

    
    func test_FactsFetcher_fetchFacts_shouldReturnCategories() async throws {
        let firestoreFetchableMock = FirestoreFetchableMock()
        let factsFetcher = FactsFetcher(firestoreService: firestoreFetchableMock)
        
        let result = try await factsFetcher.fetchCategories()
        
        XCTAssertTrue(firestoreFetchableMock.fetchCategoriesCalled)
    }

    func test_FactsFetcher_fetchCategories_shouldThrowError() async throws {
        let firestoreFetchableMock = FirestoreFetchableMock()
        let factsFetcher = FactsFetcher(firestoreService: firestoreFetchableMock)
        let mockError = MockError.mock
        firestoreFetchableMock.mockError = mockError
        
        do {
            let _ = try await factsFetcher.fetchCategories()
            XCTFail("Should have failed.")
        } catch {
            XCTAssertEqual(MockError.mock, error as! MockError)
        }
    }
    

}

class FirestoreFetchableMock: FirestoreFetchable {
    var mockError: MockError?
    private(set) var fetchFactsCalled = false
    private(set) var fetchCategoriesCalled = false
    
    func fetchFacts(with categories: [FactsApp.FactCategory]) async throws -> [FactsApp.AppFact]? {
        fetchFactsCalled = true
        if let mockError {
            throw mockError
        } else {
            return [AppFact]()
        }
    }
    
    func fetchFactCategories() async throws -> [FactsApp.FactCategory]? {
        fetchCategoriesCalled = true
        if let mockError {
            throw mockError
        } else {
            return [FactCategory]()
        }
    }
}
