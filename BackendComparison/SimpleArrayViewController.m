//
//  SimpleArrayViewController.m
//  BackendComparison
//
//  Created by Joseph Pintozzi on 12/2/13.
//  Copyright (c) 2013 softwareforgood. All rights reserved.
//

#import "SimpleArrayViewController.h"

@interface SimpleArrayViewController ()

@end

@implementation SimpleArrayViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dataArray = [NSMutableArray new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createNewItem:)];
}

- (void)createNewItem:(id)sender
{
    UIAlertView *addNewItemAlertView = [[UIAlertView alloc] initWithTitle:@"New Car" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    addNewItemAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [addNewItemAlertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark = Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex) {
        NSString *newString = [alertView textFieldAtIndex:0].text;
        if (newString.length) {
            [self addNewValue:newString];
        }
    }
}

- (void)addNewValue:(NSString*)newString
{
    NSAssert(false, [@"You need to overwrite this method in " stringByAppendingString:NSStringFromClass([self class])]);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = dataArray[indexPath.row];
    return cell;
}

@end
