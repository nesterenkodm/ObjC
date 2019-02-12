//
//  ObjC_CatchException.h
//  ObjC
//
//  Created by Dmitry Nesterenko on 08/02/2019.
//  Copyright © 2019 chebur. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjC : NSObject

/**
 A guard against unexpected objc exceptions.
 
 This method is marked as NS_REFINED_FOR_SWIFT to make it available for swift with double underscores `__catchException(_:)`.
 We need it to declare `tryBlock` argument as throwable in a swift extension on `ObjC` class.
 
 @see https://developer.apple.com/documentation/swift/objective-c_and_c_code_customization/improving_objective-c_api_declarations_for_swift
 */
+ (BOOL)catchException:(NS_NOESCAPE void (^)(NSError *__autoreleasing  _Nullable * _Nullable))tryBlock
                 error:(NSError * _Nullable __autoreleasing * _Nonnull)error
             exception:(NSException * _Nullable __autoreleasing * _Nonnull)exception NS_REFINED_FOR_SWIFT;

@end

NS_ASSUME_NONNULL_END
