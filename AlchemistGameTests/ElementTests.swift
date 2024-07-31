//
//  ElementTests.swift
//  AlchemistGameTests
//
//  Created by Cagatay Ceker on 31.07.2024.
//

import XCTest
@testable import AlchemistGame

final class ElementTests: XCTestCase {

    var elementService: ElementService!
    
    override func setUp() {
        elementService = ElementService()
    }
    
    override func tearDown() {
        elementService = nil
        super.tearDown()
    }
    
    func testInventLabCreationWithTwoElements() {
        XCTAssertEqual(elementService.getResult(input: [.fire, .water]), .steam)
        XCTAssertEqual(elementService.getResult(input: [.fire, .air]), .smoke)
        XCTAssertEqual(elementService.getResult(input: [.fire, .earth]), .lava)
        XCTAssertEqual(elementService.getResult(input: [.water, .air]), .rain)
        XCTAssertEqual(elementService.getResult(input: [.water, .earth]), .mud)
        XCTAssertEqual(elementService.getResult(input: [.air, .earth]), .dust)
    }
    
    func testInventLabCreationWithThreeElements() {
        XCTAssertEqual(elementService.getResult(input: [.fire, .water, .air]), .acidRain)
        XCTAssertEqual(elementService.getResult(input: [.fire, .water, .earth]), .plant)
        XCTAssertEqual(elementService.getResult(input: [.water, .air, .earth]), .dust)
    }

    func testInventLabCreationWithInvalidElementCount() {
        XCTAssertNil(elementService.getResult(input: [.fire]))
        XCTAssertNil(elementService.getResult(input: [.fire, .water, .air, .earth]))
    }

    func testInventLabCreationWithUnknownCombination() {
        XCTAssertNil(elementService.getResult(input: [.fire, .fire]))
        XCTAssertNil(elementService.getResult(input: [.water, .water]))
        XCTAssertNil(elementService.getResult(input: [.air, .air]))
        XCTAssertNil(elementService.getResult(input: [.earth, .earth]))
    }
}
