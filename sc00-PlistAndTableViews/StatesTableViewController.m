//
//  NamesTableViewController.m
//  sc00-PlistAndTableViews
//
//  Created by Andres Gonzalez on 11/6/17.
//  Copyright © 2017 Andres Gonzalez. All rights reserved.
//

#import "StatesTableViewController.h"
#import "TableViewCell.h"

@interface StatesTableViewController ()

@property (nonatomic, strong) NSDictionary* states;
@property (nonatomic, strong) NSArray* keys;
@end

@implementation StatesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Get the path to the plist from the Bundle
    NSString* path = [[NSBundle mainBundle] pathForResource:@"USStates" ofType:@"plist"];
    
    //grab the contents of the plist and save it to names
    self.states = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //each key is going to be a section
    //sort our keys
    self.keys = [[self.states allKeys] sortedArrayUsingSelector:@selector(compare:)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSString* key = self.keys[section];
    //for each key get an array
    NSArray* keyValues = self.states[key];
    
    return [keyValues count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"nameCell";
    
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString* key = self.keys[indexPath.section];
    NSArray* keyValues = self.states[key];
    
    //assign this to cell's text property
    cell.stateName.text = [[keyValues objectAtIndex:indexPath.row] objectForKey:@"stateName"];
    cell.stateMotto.text = [NSString stringWithFormat:@"Motto: %@",[[keyValues objectAtIndex:indexPath.row] objectForKey:@"Motto"]];
    cell.stateCapital.text = [NSString stringWithFormat:@"Capital: %@",[[keyValues objectAtIndex:indexPath.row] objectForKey:@"capitalCity"]];
    
    cell.stateFlagImg.image = [UIImage imageNamed:[[keyValues objectAtIndex:indexPath.row] objectForKey:@"flag"]];
    
    cell.statePopulation.text = [NSString stringWithFormat:@"Population: %@",[[keyValues objectAtIndex:indexPath.row] objectForKey:@"population"]];
   
    cell.stateDate.text = [NSString stringWithFormat:@"Date: %@",[[keyValues objectAtIndex:indexPath.row] objectForKey:@"yearJoinedUnion"]];
    
    //cell.stateDate.text = [[keyValues objectAtIndex:indexPath.row] objectForKey:@"yearJoinedUnion"];
    
    
    return cell;
}

-(NSArray *) sectionIndexTitlesForTableView:(UITableView *) tableView{
    return self.keys;
}





@end
