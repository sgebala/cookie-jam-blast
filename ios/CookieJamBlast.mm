//
//  CookieJamBlast.mm
//  CookieJamBlast
//
//  Created by Jesus Lopez on 11/13/2012
//  Copyright (c) 2012 SGN. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NativeLibrary.h"

@interface CookieJamBlast : NativeLibrary {
@private
}

@end

@implementation CookieJamBlast

- (id)init {
  if (self = [super init]) {
  }
  return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return NO;
}

FN_BEGIN(CookieJamBlast)
FN(<#fn#>, <#SEL#>)
FN_END

@end
