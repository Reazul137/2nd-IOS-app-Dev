

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *cuteButton;
@property (weak, nonatomic) IBOutlet UIButton *dogsButton;
@property (weak, nonatomic) IBOutlet UIButton *flowerButton;
@property (weak, nonatomic) IBOutlet UIButton *labsButton;

-(IBAction)gotoGameAction:(id)sender;
@end
