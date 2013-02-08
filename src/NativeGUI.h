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


@interface NativeGUI : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *myLabel;
@end

#endif
