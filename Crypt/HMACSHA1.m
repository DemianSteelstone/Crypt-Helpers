//
//  HMACSHA1.m
//  photomovie
//
//  Created by Evgeny Rusanov on 05.12.12.
//  Copyright (c) 2012 Macsoftex. All rights reserved.
//

#import "HMACSHA1.h"
#import <CommonCrypto/CommonHMAC.h>
#import "Base64Transcoder.h"

@implementation HMACSHA1

+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret
{
    NSData *secretData = [secret dataUsingEncoding:NSUTF8StringEncoding];
    NSData *clearTextData = [text dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char result[20];
	CCHmac(kCCHmacAlgSHA1, [secretData bytes], [secretData length], [clearTextData bytes], [clearTextData length], result);
    
    char base64Result[32];
    size_t theResultLength = 32;
    Base64EncodeData(result, 20, base64Result, &theResultLength);
    NSData *theData = [NSData dataWithBytes:base64Result length:theResultLength];
    
    NSString *base64EncodedResult = [[NSString alloc] initWithData:theData encoding:NSASCIIStringEncoding];
    
    return base64EncodedResult;
}

@end
