//
//  TutorialHelperTests.swift
//  FactsAppTests
//
//  Created by Eva Chlpikova on 04.05.2025.
//

import XCTest
@testable import FactsApp

final class TutorialHelperTests: XCTestCase {
    
    @MainActor func test_TutorialHelper_preloadCategories_shouldSetCategories() async throws {
        let appDataMock = AppDataMock()
        let fetcherMock = FetcherMock()
        let categoriesMock: [FactCategory] = FactCategory.sampleList
        fetcherMock.categoriesMock = categoriesMock
        let tutorialHelper = TutorialHelper(fetcher: fetcherMock)
        
        try await tutorialHelper.preloadCategories(into: appDataMock)
        
        XCTAssertEqual(appDataMock.setCategoriesCalledWithCategories, categoriesMock)
    }
    
    @MainActor func test_TutorialHelper_preloadCategories_shouldThrowError() async {
        let appDataMock = AppDataMock()
        let fetcherMock = FetcherMock()
        fetcherMock.errorMock = MockError.mock
        let tutorialHelper = TutorialHelper(fetcher: fetcherMock)

        do {
            try await tutorialHelper.preloadCategories(into: appDataMock)
            XCTFail("Should have failed.")
        } catch { 
            XCTAssertEqual(MockError.mock, error as! MockError)
        }
    }

}
