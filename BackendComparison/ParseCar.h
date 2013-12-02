//
//  ParseCar.h
//  BackendComparison
//
//  Created by Joseph Pintozzi on 12/2/13.
//  Copyright (c) 2013 softwareforgood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/PFObject+Subclass.h>

@interface ParseCar : PFObject <PFSubclassing>
@property (retain) NSString *name;
@end
