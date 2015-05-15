//
//  ViewController.m
//  zen
//
//  Created by XingGao on 5/10/15.
//  Copyright (c) 2015 ShiLin. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+ENPopUp.h"
#import "PopupViewController.h"

//#define TOTAL_TIME 5400
#define TOTAL_TIME 10

@interface ViewController (){
    NSTimer *timer;
    NSInteger nTotal;
    __weak IBOutlet UITextView *narattionView;
    __weak IBOutlet UIImageView *backView;
    __weak IBOutlet UIImageView *imgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popup) name:@"popup" object:nil];
    backView.hidden = YES;
    imgView.hidden = NO;
    narattionView.hidden = NO;
    
    //[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(ChangeView) userInfo:nil repeats:NO];
    
    [self performSelector:@selector(ChangeView) withObject:self afterDelay:2.0];
}
- (void) ChangeView{
    narattionView.hidden = YES;
    imgView.hidden = YES;
    backView.hidden = NO;
   [self setNotification];
   // [self popup];
   
   
}
- (void) setNotification {
    CFTimeZoneRef timeZone = CFTimeZoneCopySystem();
    
    CFRelease(timeZone);
    
    Class cls = NSClassFromString(@"UILocalNotification");
    if (cls != nil) {
        NSInteger timeInterval = 20;
        NSDate* current = [NSDate date];
        
        UILocalNotification *notif = [[cls alloc] init];
        notif.timeZone = [NSTimeZone defaultTimeZone];
        notif.fireDate = [current dateByAddingTimeInterval:timeInterval];
        notif.alertBody = @"TechNecking";
        notif.applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"Snooze" forKey:@"Zen"];
        notif.userInfo = infoDict;
        NSInteger val = arc4random() % 10 + 1;
        NSString* str_sound = [NSString stringWithFormat:@"%ld.wav", (long)val];
        notif.soundName = [str_sound copy];
        NSLog(@"notif.soundName = %@", notif.soundName);
        [[UIApplication sharedApplication] scheduleLocalNotification:notif];
        
    }

}
- (void) popup {
    PopupViewController *vc;
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    vc = (PopupViewController*)[[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PopUp"];
    if (screenSize.size.width < 768) {
      vc.view.frame = CGRectMake(0, 0, 270.0f, 230.0f);
    }else{
      vc.view.frame = CGRectMake(0, 0, 540.0f, 460.0f);
    }
    NSInteger val = arc4random() % 7 + 1;
    NSLog(@"%ld", (long)val);
    vc.popUpImage = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg", (long)val]];
    [self presentPopUpViewController:vc];
    [self setNotification];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
