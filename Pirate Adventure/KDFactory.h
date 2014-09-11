//
//  KDFactory.h
//  Pirate Adventure
//
//  Created by Kai Dickmann on 10.09.14.
//  Copyright (c) 2014 Kai Dickmann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KDCharacter.h"
#import "KDBoss.h"

@interface KDFactory : NSObject

-(NSArray *) tiles;
-(KDCharacter *) character;
-(KDBoss * ) boss;

@end
