//
//  TableViewCell.h
//  sc00-PlistAndTableViews
//
//  Created by Andres Gonzalez on 11/7/17.
//  Copyright © 2017 Andres Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *stateFlagImg;
@property (weak, nonatomic) IBOutlet UILabel *stateName;
@property (weak, nonatomic) IBOutlet UILabel *stateMotto;
@property (weak, nonatomic) IBOutlet UILabel *statePopulation;
@property (weak, nonatomic) IBOutlet UILabel *stateDate;
@property (weak, nonatomic) IBOutlet UILabel *stateCapital;

@end
