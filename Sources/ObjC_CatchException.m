//
//  ObjC_CatchException.m
//  ObjC
//
//  Created by Dmitry Nesterenko on 30/10/2018.
//  Copyright © 2018 chebur. All rights reserved.
//

#import "ObjC_CatchException.h"

@implementation ObjC

+ (BOOL)catchException:(NS_NOESCAPE void (^)(NSError *__autoreleasing  _Nullable * _Nullable))tryBlock
                 error:(NSError * _Nullable __autoreleasing *)error
             exception:(NSException * _Nullable __autoreleasing *)exception {
    @try {
        NSError *blockError;
        tryBlock(&blockError);
        if (blockError != nil) {
            if (error != NULL) {
                *error = blockError;
            }
            return NO;
        } else {
            return YES;
        }
    }
    @catch (NSException *e) {
        if (exception != NULL) {
            *exception = e;
        }
        return NO;
    }
}
    
@end
