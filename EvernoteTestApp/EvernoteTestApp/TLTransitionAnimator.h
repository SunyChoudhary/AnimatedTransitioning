//
//  TLTransitionAnimator.h
//  EvernoteTestApp
//
//  Created by Suny on 09/11/13.
//

#import <Foundation/Foundation.h>

@interface TLTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isPresenting) BOOL presenting;

@end