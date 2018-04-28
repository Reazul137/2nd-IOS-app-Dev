#import "MenuViewController.h"
#import "GameViewController.h"

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [[segue identifier] isEqualToString: @"toGameSegue"])
    {
        GameViewController* thisGameViewCtrl = [segue destinationViewController];
        
        if (sender == _cuteButton)
            thisGameViewCtrl.gameMode = @"cute";
        if (sender == _dogsButton)
            thisGameViewCtrl.gameMode = @"dogs";
        if (sender == _flowerButton)
            thisGameViewCtrl.gameMode = @"flower";
        if (sender == _labsButton)
            thisGameViewCtrl.gameMode = @"labs";
    }
}


-(IBAction)gotoGameAction:(id)sender
{
    [self performSegueWithIdentifier:@"toGameSegue" sender:sender];
}
@end
