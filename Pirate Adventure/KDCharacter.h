//
//  KDCharacter.h
//  Pirate Adventure
//
//  Created by Kai Dickmann on 10.09.14.
//  Copyright (c) 2014 Kai Dickmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KDArmor.h"
#import "KDWeapon.h"

@interface KDCharacter : NSObject

@property (strong, nonatomic) KDArmor *armor;
@property (strong, nonatomic) KDWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
