//
//  ViewController.m
//  EvernoteTestApp
//
//  Created by Suny on 09/11/13.

#import "ViewController.h"
#import "ListBanksViewController.h"
#import "TLTransitionAnimator.h"

#define INIT_BUTTON_X_POS 60
#define INIT_BUTTON_Y_POS 60
#define BUTTON_WIDTH 200
#define BUTTON_HEIGHT 40

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.views = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    //[self pushInButtons:0 animated:NO];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    //Animate back to positions
    
    [self pushInButtons:0 animated:YES];
}

-(void)resetButton {
    [self pushInButtons:0 animated:YES];
}

-(void)pushInButtons:(int)btnIndex animated:(BOOL)animated {
    
    for (int i = 0; i < 4; i++) {
        
        UIButton *btn_overlay = nil;
        if([self.views count] >= 4) {
            btn_overlay = [self.views objectAtIndex:i];
        }
        
        if(btn_overlay == nil)
        {
            btn_overlay = [[UIButton alloc] init];
            btn_overlay.tag = i;
            [btn_overlay addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
            
            NSLog(@"frame : %f,%f",btn_overlay.frame.origin.x,btn_overlay.frame.origin.y);
            [btn_overlay setBackgroundColor:[UIColor colorWithRed:1*100 green:i*0 blue:i*0 alpha:0.5]];
            
            [self.views addObject:btn_overlay];
            btn_overlay.tag = i;
            [self.view addSubview:btn_overlay];
        }
        
        //where button should actually be seen.
         CGRect endFrame = CGRectMake(INIT_BUTTON_X_POS, i*INIT_BUTTON_Y_POS +100, BUTTON_WIDTH, BUTTON_HEIGHT);
        
        if(animated) {
            
            //calculate if button should come from top/bottom
            int y = i >= self.tappedIndex ? 800 : -100;

            CGRect startRect = CGRectMake(self.view.center.x, y, BUTTON_WIDTH - 150, BUTTON_HEIGHT);
            btn_overlay.frame = startRect;
            
            [UIView animateWithDuration:0.7 animations:^{
                btn_overlay.frame = endFrame;
            } completion:^(BOOL finished) {
                //[transitionContext completeTransition:YES];
            }];
        }
        else {
            btn_overlay.frame = endFrame;
        }
    }
}

-(void)pushOutButtons:(int)btnIndex {
    
    if(btnIndex == self.tappedIndex) {
        return;
    }
    
    UIButton *btn = [self.views objectAtIndex:btnIndex];
    int y = btnIndex > self.tappedIndex ? 800 : -100;
    CGRect endFrame = CGRectMake(self.view.center.x, y, btn.frame.size.width - 150, btn.frame.size.height);
    
    [UIView animateWithDuration:0.7 animations:^{
        btn.frame = endFrame;
    } completion:^(BOOL finished) {
        //[transitionContext completeTransition:YES];
    }];
}

-(void)buttonTap:(UIButton*)btn {
    
    self.tappedIndex = btn.tag;
    
    switch (btn.tag) {
        case 0: {
            
            ListBanksViewController *viewController = [ListBanksViewController new];
            viewController.transitioningDelegate = self;
            viewController.delegate = self;
            viewController.modalPresentationStyle = UIModalPresentationCustom;
            //[self.navigationController pushViewController:viewController animated:YES];
            [self presentViewController:viewController animated:YES completion:nil];
            
        }
            break;
        case 1: {
            NSLog(@"1st tap :");
            
            ListBanksViewController *viewController = [ListBanksViewController new];
            viewController.transitioningDelegate = self;
            viewController.delegate = self;
            viewController.modalPresentationStyle = UIModalPresentationCustom;
            //[self.navigationController pushViewController:viewController animated:YES];
            [self presentViewController:viewController animated:YES completion:nil];
            
        }
            break;
        case 2: {
            NSLog(@"2nd tap :");
            
            ListBanksViewController *viewController = [ListBanksViewController new];
            viewController.transitioningDelegate = self;
            viewController.delegate = self;
            viewController.modalPresentationStyle = UIModalPresentationCustom;
            //[self.navigationController pushViewController:viewController animated:YES];
            [self presentViewController:viewController animated:YES completion:nil];
            
        }
            break;
        case 3: {
            NSLog(@"3rd tap :");
            ListBanksViewController *viewController = [ListBanksViewController new];
            viewController.transitioningDelegate = self;
            viewController.delegate = self;
            viewController.modalPresentationStyle = UIModalPresentationCustom;
            //[self.navigationController pushViewController:viewController animated:YES];
            [self presentViewController:viewController animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
    
    [self pushOutButtons:0];
    [self pushOutButtons:1];
    [self pushOutButtons:2];
    
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    TLTransitionAnimator *animator = [TLTransitionAnimator new];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TLTransitionAnimator *animator = [TLTransitionAnimator new];
    return animator;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
