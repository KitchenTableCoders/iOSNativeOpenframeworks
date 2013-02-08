//
//  NativeGUI.m
//  KTCiOS
//
//  Created by Amit Pitaru on 2/8/13.
//
//

#import "NativeGUI.h"
/*
@interface NativeGUI ()

@end
*/

@implementation NativeGUI
@synthesize myLabel;
@synthesize colorSlider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	myLabel.text = ofxStringToNSString( "---> Ahoy From Code! <---");
	ofSendMessage("NATIVE_VIEW_DID_LOAD");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clearBtnPressed:(id)sender {
	ofSendMessage("NATIVE_CLEAR_BTN_PRESSED");
}

-(IBAction)colorSliderMoved:(id)sender {
	UISlider *slider = (UISlider *)sender;
	ofSendMessage("NATIVE_COLOR_SLIDER_VAL_CHANGED");

}


@end
