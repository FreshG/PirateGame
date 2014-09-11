//
//  KDFactory.m
//  Pirate Adventure
//
//  Created by Kai Dickmann on 10.09.14.
//  Copyright (c) 2014 Kai Dickmann. All rights reserved.
//

#import "KDFactory.h"
#import "KDTile.h"

@implementation KDFactory

-(NSArray *) tiles{
    KDTile *tile1 = [[KDTile alloc] init];
    KDTile *tile2 = [[KDTile alloc] init];
    KDTile *tile3 = [[KDTile alloc] init];
    KDTile *tile4 = [[KDTile alloc] init];
    KDTile *tile5 = [[KDTile alloc] init];
    KDTile *tile6 = [[KDTile alloc] init];
    KDTile *tile7 = [[KDTile alloc] init];
    KDTile *tile8 = [[KDTile alloc] init];
    KDTile *tile9 = [[KDTile alloc] init];
    KDTile *tile10 = [[KDTile alloc] init];
    KDTile *tile11 = [[KDTile alloc] init];
    KDTile *tile12 = [[KDTile alloc] init];
    
    tile1.story = @"1 Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
   
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    
    tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";
    
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    
    tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    
    tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    
    tile7.story = @"7 You sight a pirate battle off the coast";
    
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    
    tile10.story = @"10 A group of pirates attempts to board your ship";
    
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.isBossTile = YES;

    
    
    KDWeapon *bluntedSword = [[KDWeapon alloc]init];
    bluntedSword.name = @"Stumpfes Schwert";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    
    KDWeapon *pistolWeapon = [[KDWeapon alloc]init];
    pistolWeapon.name = @"Pistole";
    pistolWeapon.damage = 17;
    tile5.weapon = pistolWeapon;
    
    
    KDArmor *steelArmor = [[KDArmor alloc] init];
    steelArmor.name = @"Stahlrüstung";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    
    KDArmor *parrotArmor = [[KDArmor alloc] init];
    parrotArmor.name = @"Papagei";
    parrotArmor.health = 20;
    tile4.armor = parrotArmor;
    
    
    tile3.healthEffect = 12;
    tile6.healthEffect = -22;
    tile7.healthEffect = 8;
    tile8.healthEffect = -46;
    tile9.healthEffect = 20;
    tile10.healthEffect = -15;
    tile11.healthEffect = -7;
    tile12.healthEffect = -15;
    
    tile2.actionButtonName = @"Nehme Schwert";
    tile2.actionButtonName = @"Nehme Rüstung";
    tile3.actionButtonName = @"Am Hafen anhalten.";
    tile4.actionButtonName = @"Papagei adoptieren";
    tile5.actionButtonName = @"Pistole nehmen";
    tile6.actionButtonName = @"Keine Angst zeigen.";
    tile7.actionButtonName = @"Kämpfe!";
    tile8.actionButtonName = @"Schiff verlassen";
    tile9.actionButtonName = @"Schatz mitnehmen";
    tile10.actionButtonName = @"Eindringlinge zurückfrängen";
    tile11.actionButtonName = @"Tiefer schwimmen";
    tile12.actionButtonName = @"Kämpfen!";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc]init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc]init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc]init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc]init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    return [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
}

-(KDCharacter *) character
{
    KDCharacter * character = [[KDCharacter alloc] init];
    character.health = 100;
    KDArmor *armor  = [[KDArmor alloc] init];
    armor.name = @"Umhang";
    armor.health = 5;
    character.armor = armor;
    
    KDWeapon * weapon = [[KDWeapon alloc] init];
    weapon.name = @"Faust";
    weapon.damage = 10;
    
    character.weapon = weapon;
    
    return character;
    
}

-(KDBoss *) boss
{
    KDBoss *boss = [[KDBoss alloc] init ];
    boss.health = 65;
    return boss;
}

@end
