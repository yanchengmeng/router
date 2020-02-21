//
//  WifiInfoWrapper.h
//
//  Created by Samuel on 2019/12/10.
//  Copyright © 2019年 Samuel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WifiInfoWrapper : NSObject
@property (nonatomic, copy) NSString *gateway;
@property (nonatomic, copy) NSString *deviceIP;
@property (nonatomic, copy) NSString *netmask;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *broadcast;
@property (nonatomic, copy) NSArray *ipsInRange;
- (void)updateData;
- (NSString *)description;
@end
