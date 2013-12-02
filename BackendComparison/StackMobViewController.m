//
//  StackMobViewController.m
//  BackendComparison
//
//  Created by Joseph Pintozzi on 12/2/13.
//  Copyright (c) 2013 softwareforgood. All rights reserved.
//

#import "StackMobViewController.h"
#import "StackMob.h"

@interface StackMobViewController (){
    SMClient *smClient;
}

@end

@implementation StackMobViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    smClient = [[SMClient alloc] initWithAPIVersion:@"0" publicKey:kStackMobPublicKey];
    [self loadCars];
}

- (void)loadCars
{
    dataArray = [NSMutableArray new];
    [[smClient dataStore] performQuery:[[SMQuery alloc] initWithSchema:@"cars"] onSuccess:^(NSArray *results) {
        for (NSDictionary *result in results) {
            [dataArray addObject:result[@"name"]];
        }
        [self.tableView reloadData];
    } onFailure:^(NSError *error) {
        alert(error.localizedDescription);
    }];
}

- (void)addNewValue:(NSString*)newString
{
    [[smClient dataStore] createObject:@{@"name": newString} inSchema:@"cars" onSuccess:^(NSDictionary *object, NSString *schema) {
        [self loadCars];
    } onFailure:^(NSError *error, NSDictionary *object, NSString *schema) {
        alert(error.localizedDescription);
    }];
}

@end
