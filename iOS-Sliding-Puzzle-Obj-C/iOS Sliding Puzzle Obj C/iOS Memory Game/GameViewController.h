//
//  ViewController.h
//  iOS Memory Game
//
//  Created by Amir on 3/7/17.
//  Copyright © 2017 Cinard Digital Media Institute. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIImageView *sampleImgView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;


@property (weak, nonatomic) NSString* gameMode;


- (IBAction)backAction:(id)sender;
@end

