//
//  ViewController.m
//  fis-auto-layout
//
//  Created by Mason Macias on 6/29/15.
//  Copyright (c) 2015 Mason Macias. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (strong, nonatomic) NSLayoutConstraint *textViewBottom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view removeConstraints:self.view.constraints];
    
    
    // item1's attribute = item2's attribute * multiplier + constant
    
    
    self.textViewBottom = [NSLayoutConstraint constraintWithItem:self.textView
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.bottomLeftButton
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:-20];
    
    [self.view addConstraint:self.textViewBottom];
    
    
    
    NSLayoutConstraint *textViewTop = [NSLayoutConstraint constraintWithItem:self.textView
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                    constant:20];
    [self.view addConstraint:textViewTop];
    
    NSLayoutConstraint *textViewLeft = [NSLayoutConstraint constraintWithItem:self.textView
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeLeft
                                                                  multiplier:1.0
                                                                    constant:10];
    [self.view addConstraint:textViewLeft];
    
    
    NSLayoutConstraint *textViewRight = [NSLayoutConstraint constraintWithItem:self.textView
                                                                   attribute:NSLayoutAttributeRight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:-10];
    [self.view addConstraint:textViewRight];
    //LEFT BUTTON CONSTAINTS

    NSLayoutConstraint *buttonLeft = [NSLayoutConstraint constraintWithItem:self.bottomLeftButton
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1.0
                                                                   constant:10];
    
    [self.view addConstraint:buttonLeft];
    
    NSLayoutConstraint *buttonBottom = [NSLayoutConstraint constraintWithItem:self.bottomLeftButton
                                                                  attribute:NSLayoutAttributeBottom
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeBottom
                                                                 multiplier:1.0
                                                                   constant:0];
    
    [self.view addConstraint:buttonBottom];
    
    //RIGHT BUTTON CONSTAINTS
    NSLayoutConstraint *buttonRightRight = [NSLayoutConstraint constraintWithItem:self.bottomRightButton
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                   constant:-10];
    
    [self.view addConstraint:buttonRightRight];
    
    NSLayoutConstraint *buttonRightBottom = [NSLayoutConstraint constraintWithItem:self.bottomRightButton
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0];
    
    [self.view addConstraint:buttonRightBottom];
    
    
    if (self.view.frame.size.height == 480 ) {
        self.textViewBottom.constant = -100;
    }


}

- (void)orientationChanged:(NSNotification *)notification {
    // Respond to changes in device orientation

[self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];

}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            
            
            NSLog(@"PORTRAIT");
            self.textViewBottom.constant = -20;

            
            

        }
            
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
            
            NSLog(@"LANDSCAPE");
            
            self.textViewBottom.constant = -10;



        }
            break;
        case UIInterfaceOrientationUnknown:break;
    }
}

-(void) viewDidDisappear {
    // Request to stop receiving accelerometer events and turn off accelerometer
    
     [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
