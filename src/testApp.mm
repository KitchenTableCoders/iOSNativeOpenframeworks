#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation 
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(127,127,127);
	
	nativeGui = [[NativeGUI alloc] initWithNibName:@"NativeGUI" bundle:Nil];
	[nativeGui retain];
	[ofxiPhoneGetGLView() addSubview:nativeGui.view];
	
	ofFbo::Settings settings;
	settings.width = ofGetWidth();
	settings.height = ofGetHeight();
	settings.internalformat = GL_RGBA;
	settings.numSamples = 0;
	settings.useDepth = true;
	settings.useStencil = true;
	myFbo.allocate(settings);
	
	ofBackground(100);
	ofEnableAlphaBlending();
	
}

void testApp::gotMessage(ofMessage msg){
	cout << msg.message << endl;
}

void testApp::deleteOldTouches(){
	
	vector<Touch_t>::iterator it = touchVec.begin();
	
	while (it != touchVec.end())
    {
		if ( !it->isDown){
			cout << "erasing " << it->touchId << endl;
			it = touchVec.erase(it);
		} else {
			++it;
		}
    }
}

//--------------------------------------------------------------
void testApp::update(){
	deleteOldTouches();
}

//--------------------------------------------------------------
void testApp::draw(){

	
	myFbo.begin();
	ofSetColor(255,75);
	ofBeginShape();
	for(int i = 0; i < touchVec.size(); i++){
		ofTouchEventArgs _t = touchVec[i].touchEvent;
		ofVertex(_t.x, _t.y);
		
	}
	ofEndShape();
	myFbo.end();
	
	myFbo.draw(0, 0, ofGetWidth(), ofGetHeight());
	
	ofSetColor(255, 0, 0,100);
	for(int i = 0; i < touchVec.size(); i++){
		ofTouchEventArgs _t = touchVec[i].touchEvent;
		ofEllipse(_t.x, _t.y, touchVec[i].numTouchesAlive, touchVec[i].numTouchesAlive);
		
	}
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
	Touch_t _t;
	_t.touchId = touch.id;
	_t.isDown = true;
	_t.touchEvent = touch;
	_t.numTouchesAlive = 0;
	touchVec.push_back(_t);
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
	for(int i = touchVec.size() - 1; i >= 0; i--)
	{
		if(touchVec[i].touchId == touch.id){
			touchVec[i].touchEvent = touch;
			touchVec[i].numTouchesAlive ++;
			break;
		}
	}

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
	for(int i = touchVec.size() - 1; i >= 0; i--)
	{
		if(touchVec[i].touchId == touch.id){// && t[i].isActive){
			touchVec[i].touchEvent = touch;
			touchVec[i].numTouchesAlive ++;
			touchVec[i].isDown = false;
			break;
		}
	}
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}

