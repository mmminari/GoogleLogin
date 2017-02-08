//
//  DetailViewController.m
//  GoogleLogin
//
//  Created by 김민아 on 2017. 2. 3..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"



@interface DetailViewController ()

@property (strong, nonatomic) GIDGoogleUser *userProfile;


@property (weak, nonatomic) IBOutlet UILabel *lbUserName;
@property (weak, nonatomic) IBOutlet UILabel *lbUserId;
@property (weak, nonatomic) IBOutlet UILabel *lbUserEmail;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"addGoogleUserInfo" object:nil];
}

#pragma mark - NSNotification

- (void)receiveNotification:(NSNotification *)noti
{
    NSLog(@"recieveNotification");
    
    if([noti.name isEqualToString:@"addGoogleUserInfo"])
    {
        NSDictionary *userInfo = noti.userInfo;
        
        NSLog(@"userInfo : %@", noti.userInfo);
        
        self.userProfile = [userInfo objectForKey:@"userInfo"];
        
        [self setUserDataWithUserProfile:self.userProfile.profile userId:self.userProfile.userID];
    }
}

#pragma mark - Private Action

- (void)setUserDataWithUserProfile:(GIDProfileData *)profileData userId:(NSString *)userId
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.lbUserId.text = userId;
        
        self.lbUserName.text = profileData.name;
        
        self.lbUserEmail.text = profileData.email;
        
    });
}

#pragma mark - User Action

- (IBAction)touchedLogOutButton:(UIButton *)sender
{
    [[GIDSignIn sharedInstance] signOut];
        
    NSLog(@"Sign Out");
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
