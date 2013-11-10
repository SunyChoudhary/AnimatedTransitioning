//
//  ViewController.h
//  EvernoteTestApp
//
//  Created by Suny on 09/11/13.

#import <UIKit/UIKit.h>

@protocol ResetButtonsDelegate
@optional
-(void)resetButton;

@end
@interface ViewController : UIViewController <UIViewControllerTransitioningDelegate,ResetButtonsDelegate>
{
}
@property(readwrite)int tappedIndex;
@property(nonatomic,strong)NSMutableArray *views;
@end
