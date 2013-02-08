//
//  NativeGUI.h
//  KTCiOS
//
//  Created by Amit Pitaru on 2/8/13.
//
//

#ifndef _NATIVE_GUI_H
#define _NATIVE_GUI_H

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

#import <UIKit/UIKit.h>


@interface NativeGUI : UIViewController{
	Boolean flipped;
}

@property (retain, nonatomic) IBOutlet UILabel *myLabel;
@property (retain, nonatomic) IBOutlet UISlider *colorSlider;
@property  Boolean flipped;

-(IBAction)clearBtnPressed:(id)sender;
-(IBAction)colorSliderMoved:(id)sender;
-(void)flipView;

@end

#endif
