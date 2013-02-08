#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "NativeGUI.h"

class testApp : public ofxiPhoneApp{
	
public:
	
	typedef struct {
		int touchId;
		bool isDown;
		int numTouchesAlive;
		ofTouchEventArgs touchEvent;
	} Touch_t;
	
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs & touch);
	void touchMoved(ofTouchEventArgs & touch);
	void touchUp(ofTouchEventArgs & touch);
	void touchDoubleTap(ofTouchEventArgs & touch);
	void touchCancelled(ofTouchEventArgs & touch);
	
	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
	
	void gotMessage(ofMessage msg);
	
	NativeGUI * nativeGui;
	
	vector<Touch_t> touchVec;
	void deleteOldTouches();
	
	ofFbo myFbo;
};


