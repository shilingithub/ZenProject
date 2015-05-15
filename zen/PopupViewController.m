//
//  PopupViewController.m
//  zen
//
//  Created by XingGao on 5/10/15.
//  Copyright (c) 2015 ShiLin. All rights reserved.
//

#import "PopupViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface PopupViewController (){
    AVAudioPlayer *player;
}

@property (weak, nonatomic) IBOutlet UIImageView *popImageView;

@end

@implementation PopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated{
    self.popImageView.image = self.popUpImage;
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:self.strSound
                                                              ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                                   error:nil];
    //player.numberOfLoops = -1; //Infinite
    
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidDisappear:(BOOL)animated{
    [player stop];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
