//
//  NSObject+DCTRemember.h
//  DCTRemember
//
//  Created by Daniel Tull on 10.08.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DCTRemember)

- (id)remember;
- (void)forget;
- (NSUInteger)rememberCount;

@end
