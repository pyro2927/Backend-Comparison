//
//  ParseViewController.m
//  BackendComparison
//
//  Created by Joseph Pintozzi on 12/2/13.
//  Copyright (c) 2013 softwareforgood. All rights reserved.
//

#import "ParseViewController.h"
#import <Parse/Parse.h>
#import "ParseCar.h"

@implementation ParseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [ParseCar registerSubclass];
    [Parse setApplicationId:kParseAppId clientKey:kParseClientKey];
    [self loadCars];
}

- (void)loadCars
{
    PFQuery *existingCarQuery = [ParseCar query];
    [existingCarQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            dataArray = [NSMutableArray new];
            for (ParseCar *car in objects) {
                [dataArray addObject:car.name];
            }
            [self.tableView reloadData];
        }
    }];
}

- (void)addNewValue:(NSString*)newString
{
    ParseCar *newCar = [ParseCar object];
    newCar.name = newString;
    [newCar saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            alert(error.localizedDescription);
        } else {
            [self loadCars];
        }
    }];
}

@end
