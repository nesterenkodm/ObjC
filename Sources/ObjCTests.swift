//
//  ObjCTests.swift
//  Tests
//
//  Created by Dmitry Nesterenko on 08/02/2019.
//  Copyright © 2019 chebur. All rights reserved.
//

import XCTest
import ObjC

class ObjCTests: XCTestCase {

    enum Error: Swift.Error {
        case error
    }

    func testThrowsNoException() {
        XCTAssertNoThrow(try ObjC.catchException {
            _ = 1 + 1
        })
    }
    
    func testRethrowsSwiftException() {
        XCTAssertThrowsError(try ObjC.catchException {
            throw Error.error
        })
    }

    func testRethrowsObjCUnexpectedException() {
        do {
            try ObjC.catchException {
                let collectionView = UICollectionView()
                collectionView.insertItems(at: [IndexPath(row: 10, section: 10)])
            }
        } catch {
            if case ObjC.Error.exception = error {
                XCTAssertEqual(error.localizedDescription, "UICollectionView must be initialized with a non-nil layout parameter", "Thrown error localized description must be proxied to NSException description")
                return
            }
            XCTAssert(false, "Thrown error has to be kind of NSException class")
        }
        XCTAssert(false, "Should throw NSException error")
    }
    
}
