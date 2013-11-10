//
//  ListBanksViewController.h
//  EvernoteTestApp
//
//  Created by Suny on 09/11/13.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ListBanksViewController : UIViewController

@property(nonatomic,strong)IBOutlet UIButton * backBtn;
@property(nonatomic) id <ResetButtonsDelegate> delegate;

-(IBAction)backPressed:(id)sender;
@end
