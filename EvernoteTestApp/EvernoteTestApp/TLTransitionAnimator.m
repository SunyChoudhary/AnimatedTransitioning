//
//  TLTransitionAnimator.m
//  EvernoteTestApp
//
//  Created by Suny on 09/11/13.
//

#import "TLTransitionAnimator.h"
#import "AppDelegate.h"
#import "ViewController.h"

@implementation TLTransitionAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.6f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // Grab the from and to view controllers from the context
    ViewController *fromViewController = (ViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];

    // Set our ending frame. We'll modify this later if we have to
    CGRect endFrame = CGRectMake(0, 0, delegate.window.frame.size.width, delegate.window.frame.size.height);
    
    if (self.presenting) {
        fromViewController.view.userInteractionEnabled = NO;
        
        [transitionContext.containerView addSubview:fromViewController.view];
        [transitionContext.containerView addSubview:toViewController.view];
        
//        CGRect startFrame = endFrame;
//        startFrame.origin.x += delegate.window.frame.size.width;
        
        toViewController.view.frame = CGRectMake(60, fromViewController.tappedIndex*60 + 100, 200, 40);

        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
            toViewController.view.frame = endFrame;
            toViewController.view.center = CGPointMake(fromViewController.view.center.x, fromViewController.view.center.y);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        
        ViewController *viewController = (ViewController*)toViewController;
        toViewController.view.userInteractionEnabled = YES;
        
        [transitionContext.containerView addSubview:toViewController.view];
        [transitionContext.containerView addSubview:fromViewController.view];
        
        endFrame = CGRectMake(60, viewController.tappedIndex*60 + 100, 200, 40);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
            fromViewController.view.frame = endFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end