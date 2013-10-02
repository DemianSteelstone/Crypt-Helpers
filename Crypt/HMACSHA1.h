//
//  HMACSHA1.h
//  photomovie
//
//  Created by Evgeny Rusanov on 05.12.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMACSHA1 : NSObject

+(NSString*)hmacsha1:(NSString *)text key:(NSString *)secret;

@end
