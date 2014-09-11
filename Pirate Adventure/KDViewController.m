//
//  KDViewController.m
//  Pirate Adventure
//
//  Created by Kai Dickmann on 10.09.14.
//  Copyright (c) 2014 Kai Dickmann. All rights reserved.
//

#import "KDViewController.h"
#import "KDFactory.h"
#import "KDTile.h"

@interface KDViewController ()

@end

@implementation KDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    KDFactory *factory = [[KDFactory alloc]init];
    self.character = [factory character];
    self.tiles = [factory tiles];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0, 0);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    KDTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];

    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    if ([tile isBossTile]) {
        self.boss.health = self.boss.health - self.character.damage;
        NSLog(@"%i", self.boss.health);
    }
    
    if (self.character.health < 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tot" message:@"Du bist tot, das Spiel ist zuende" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }

    else if (self.boss.health < 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sieg" message:@"Der Boss ist tot, Du hast gewonnen" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    
    [self updateTile];

}

- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
    
}

# pragma mark helperMethods

- (void) updateTile
{
    KDTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = [NSString stringWithFormat:@"%@", self.character.armor.name];
    self.weaponLabel.text = [NSString stringWithFormat:@"%@", self.character.weapon.name];
    
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    [self.storyLabel sizeToFit];
    
}

- (void)updateButtons
{
    self.westButton.enabled = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x-1, self.currentPoint.y)];
    self.eastButton.enabled = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x+1, self.currentPoint.y)];
    self.northButton.enabled = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y+1)];
    self.southButton.enabled = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)];
    
}

-(void) updateCharacterStatsForArmor:(KDArmor *) armor withWeapons:(KDWeapon *) weapon withHealthEffect:(int) healthEffect
{
    if (armor!=nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }else{
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}


-(BOOL) tileExistsAtPoint:(CGPoint) point
{
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    }else{
        return YES;
    }
    
}
@end
