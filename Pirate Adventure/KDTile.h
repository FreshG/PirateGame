//
//  KDTile.h
//  Pirate Adventure
//
//  Created by Kai Dickmann on 10.09.14.
//  Copyright (c) 2014 Kai Dickmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KDWeapon.h"
#import "KDArmor.h"

@interface KDTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;

@property (strong, nonatomic) KDWeapon *weapon;
@property (strong, nonatomic) KDArmor *armor;

@property (nonatomic) int healthEffect;

@property (nonatomic) BOOL isBossTile;

@end
