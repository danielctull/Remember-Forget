//
//  NSObject+DCTRemember.m
//  DCTRemember
//
//  Created by Daniel Tull on 10.08.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "NSObject+DCTRemember.h"
#import <objc/runtime.h>

static NSString *DCTRememberObjectKey = @"DCTRememberObjectKey";
static NSString *DCTRememberCountKey = @"DCTRememberCountKey";

@interface NSObject ()
- (void)dctInternal_setRememberCount:(NSUInteger)count;
- (id)dctInternal_associatedSelf;
@end

@implementation NSObject (DCTRemember)

- (id)remember {
	[self dctInternal_setRememberCount:self.rememberCount+1];
	
	if ([self dctInternal_associatedSelf] == nil)
		objc_setAssociatedObject(self, (__bridge_retained void*)DCTRememberObjectKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	
	return self;
}

- (void)forget {
	[self dctInternal_setRememberCount:self.rememberCount-1];
	
	if (self.rememberCount == 0)
		objc_setAssociatedObject(self, (__bridge_retained void*)DCTRememberObjectKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)rememberCount {
	NSNumber *count = objc_getAssociatedObject(self, (__bridge_retained void*)DCTRememberCountKey);
	return [count unsignedIntegerValue];
}

- (void)dctInternal_setRememberCount:(NSUInteger)count {
	objc_setAssociatedObject(self, (__bridge_retained void*)DCTRememberCountKey, [NSNumber numberWithUnsignedInteger:count], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)dctInternal_associatedSelf {
	return objc_getAssociatedObject(self, (__bridge_retained void*)DCTRememberObjectKey);
}

@end
