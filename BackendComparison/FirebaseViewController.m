//
//  FirebaseViewController.m
//  BackendComparison
//
//  Created by Joseph Pintozzi on 12/2/13.
//  Copyright (c) 2013 softwareforgood. All rights reserved.
//

#import "FirebaseViewController.h"
#import <Firebase/Firebase.h>

@interface FirebaseViewController () {
    Firebase *carsRef;
}

@end

@implementation FirebaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    carsRef = [[Firebase alloc] initWithUrl:[kFirebaseURL stringByAppendingString:@"cars"]];
    [carsRef observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
        //fired once per child, so each snapshot is one object
        [dataArray addObject:snapshot.value];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:dataArray.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    }];
}

- (void)addNewValue:(NSString*)newString
{
    [[carsRef childByAutoId] setValue:newString];
}

@end
