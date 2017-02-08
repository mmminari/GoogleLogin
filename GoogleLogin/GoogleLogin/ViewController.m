//
//  ViewController.m
//  GoogleLogin
//
//  Created by 김민아 on 2017. 2. 3..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    [GIDSignIn sharedInstance].uiDelegate = self;

}

- (IBAction)touchedGoogleSignInButton:(UIButton *)sender
{    
    [[GIDSignIn sharedInstance] signIn];
}

- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"SignInSuccess : %@", signIn);
        
        [self performSegueWithIdentifier:@"googleLogin" sender:self];
    }];
}



@end
