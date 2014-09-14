//
//  Utils.h
//  DateAndTime
//
//  Created by sravan.vodnala on 31/03/14.
//  Copyright (c) 2014 sravan.vodnala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Utils : NSObject
+(NSString *)RetrieveDate:(NSString *)str;
+(NSString *)retriveTime:(NSString *)str;
+(NSString *) getLocalizedString:(NSString *)name;

+ (NSString *)hmacsha1:(NSString *)text key:(NSString *)secret;
+(BOOL)checkNet;

+(NSString *)getNormalString:(NSString *)stringTemp;
+(CGFloat )getHeightOfString:(NSString *)string withFont:(UIFont *)fontType withWidth:(CGFloat)width;
@end
