//
//  ObjC.swift
//  ObjC
//
//  Created by Dmitry Nesterenko on 08/02/2019.
//  Copyright © 2019 chebur. All rights reserved.
//

import Foundation

extension ObjC {
    
    public static func catchException(_ body: () throws -> Void) throws {
        try ObjC.__catchException { errorPointer in
            do {
                try body()
            } catch {
                errorPointer?.pointee = error as NSError
            }
        }
    }
    
}
