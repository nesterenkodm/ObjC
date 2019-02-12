//
//  ObjC.swift
//  ObjC
//
//  Created by Dmitry Nesterenko on 08/02/2019.
//  Copyright © 2019 chebur. All rights reserved.
//

import Foundation

extension ObjC {
    
    public enum Error: LocalizedError {
        case exception(NSException)
        
        public var errorDescription: String? {
            switch self {
            case .exception(let exception):
                return exception.description
            }
        }
    }
    
    public static func catchException(_ body: () throws -> Void) throws {
        var exception: NSException?
        var error: NSError?
        
        ObjC.__catchException({ errorPointer in
            do {
                try body()
            } catch {
                errorPointer?.pointee = error as NSError
            }
        }, error: &error, exception: &exception)
        
        if let exception = exception {
            throw Error.exception(exception)
        } else if let error = error {
            throw error
        }
    }
    
}
