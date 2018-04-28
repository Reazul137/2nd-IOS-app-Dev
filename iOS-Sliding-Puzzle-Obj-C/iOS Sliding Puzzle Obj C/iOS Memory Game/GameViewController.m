#import "GameViewController.h"

@interface GameViewController ()
{
    float gameViewWidth;
    
    NSMutableArray* blocksArr;
    NSMutableArray* centersArr;
    
    
    CGPoint empty;
    
    float blockWidth;
    
    
    int timeCount;
    NSTimer* gameTimer;
}
@end

@implementation GameViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}




-(void)viewDidAppear:(BOOL)animated
{
    
    NSString* nameForSample = [NSString stringWithFormat:@"%@Sample.jpg", _gameMode];
    _sampleImgView.image = [UIImage imageNamed:nameForSample];
    
    [super viewDidAppear:YES];
    
    
    [_gameView layoutIfNeeded];
    gameViewWidth = _gameView.frame.size.width;
    
    [self makeBlocksAction];
    [self randomizeAction];

    
    timeCount = 60;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(timerAction)
                                               userInfo:nil
                                                repeats:YES];
}

-(void)timerAction
{
    if ( timeCount > 0 )
    {
        timeCount --;
        _timerLabel.text = [NSString stringWithFormat:@"%d\"", timeCount];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}



-(void)makeBlocksAction
{
    
    blocksArr = [NSMutableArray new];
    centersArr = [NSMutableArray new];
    
    
    
    blockWidth = gameViewWidth / 4;
    
    float xCen = blockWidth / 2;
    float yCen = blockWidth / 2;
    
    int imgNum = 1;
    
    
    for ( int h = 0; h < 4; h ++)
    {
        for ( int v = 0; v < 4; v ++)
        {
            CGPoint newCen = CGPointMake(xCen, yCen);
            
            CGRect blockFrame = CGRectMake(0, 0, blockWidth-3, blockWidth-3);
            UIImageView* block = [[UIImageView alloc] initWithFrame:blockFrame];
            
            NSString* imgName = [NSString stringWithFormat:@"%@_%02d.jpg",_gameMode, imgNum];
            block.image = [UIImage imageNamed: imgName];
            block.center = newCen;
            [_gameView addSubview: block];
            
            [blocksArr addObject: block];
            [centersArr addObject: [NSValue valueWithCGPoint:newCen]];
            
            
            
            xCen += blockWidth;
            imgNum = imgNum + 1;
        }
        
        yCen = yCen + blockWidth;
        xCen = blockWidth / 2;
    }
}


-(void)randomizeAction
{
    [[blocksArr objectAtIndex:15] removeFromSuperview];
    [blocksArr removeObjectAtIndex: 15];
    
    // randomize their locations
    
    for ( UIImageView* any in blocksArr)
    {
        any.userInteractionEnabled = true;
        
        int randomIndex = arc4random() % centersArr.count;
        any.center = [[centersArr objectAtIndex:randomIndex] CGPointValue];
        
        [centersArr removeObjectAtIndex: randomIndex];
    }
    
    
    // one center is still in the array
    empty = [[centersArr objectAtIndex:0] CGPointValue];
    
}




-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* myTouch = [[touches allObjects] objectAtIndex:0];
    
    UIView* touchView = myTouch.view;
    
    if ( [blocksArr containsObject: touchView])
    {
        // let's cacluate the didstance between this view's center
        // and the empty center
        
        float xDif = touchView.center.x - empty.x;
        float yDif = touchView.center.y - empty.y;
        
        
        float distance = sqrt(pow(xDif, 2) + pow(yDif, 2));
        
        if ( distance == blockWidth)
        {
            CGPoint tempCen = touchView.center;

            
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:.5];
            touchView.center = empty;
            [UIView commitAnimations];
            
            
            empty = tempCen;
        }
        
    }
    
}






- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
