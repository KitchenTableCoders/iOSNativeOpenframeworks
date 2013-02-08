#include "ofMain.h"
#include "testApp.h"

int main(){
	NSAutoreleasePool * p = [[NSAutoreleasePool alloc] init];
	ofAppiPhoneWindow * iOSWindow = new ofAppiPhoneWindow();
	
	//iOSWindow->enableDepthBuffer();
	//iOSWindow->enableAntiAliasing(4);
	if ( [[UIScreen mainScreen] scale] > 1 ){
		iOSWindow->enableRetinaSupport();
		cout << "RETINA ENABLED" << endl;
	}
	
	[p release];
	
	ofSetupOpenGL(iOSWindow ,320, 480, OF_FULLSCREEN);
	testApp * app = new testApp();
	ofRunApp( app );
	
	//ofSetupOpenGL(1024,768, OF_FULLSCREEN);			// <-------- setup the GL context
	//ofRunApp(new testApp);
	
	
}
