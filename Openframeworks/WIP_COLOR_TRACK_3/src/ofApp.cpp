#include "ofApp.h"
#include "ofMain.h"

void ofApp::setup(){
    ofBackground(ofRandom(0, 255),ofRandom(0, 255),ofRandom(0, 255));
    
    
    w = 320;
    h = 240;
    
    movie.initGrabber(w, h, true);
    

    rgb.allocate(w, h);
    hsb.allocate(w, h);
    hue.allocate(w, h);
    sat.allocate(w, h);
    bri.allocate(w, h);
    filtered.allocate(w, h);
}

//--------------------------------------------------------------
void ofApp::update(){
    movie.update();
    
    if (movie.isFrameNew()) {
        

        rgb.setFromPixels(movie.getPixels(), w, h);
        

        rgb.mirror(false, true);
        

        hsb = rgb;
        

        hsb.convertRgbToHsv();
        

        hsb.convertToGrayscalePlanarImages(hue, sat, bri);
        

        for (int i=0; i<w*h; i++) {
            filtered.getPixels()[i] = ofInRange(hue.getPixels()[i],findHue-5,findHue+5) ? 255 : 0;
        }
        filtered.flagImageChanged();
        

        contours.findContours(filtered, 50, w*h/2, 1, false);
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255,255,255);
    ofRect(0, 0, 320, 240);
    

    rgb.draw(320,0);
    hsb.draw(640,0);
    hue.draw(0,240);
    sat.draw(320,240);
    bri.draw(640,240);
    filtered.draw(0,480);
    contours.draw(0,480);
    
    

    ofSetColor(ofRandom(0, 255), ofRandom(0, 255), ofRandom(0, 255));
    ofFill();
    
    for (int i=0; i<contours.nBlobs; i++) {
        ofCircle(contours.blobs[i].centroid.x, contours.blobs[i].centroid.y, ofRandom(5,15));
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
    
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
    
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

    int mx = x % w;
    int my = y % h;
    

    findHue = hue.getPixels()[my*w+mx];
}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){
    
}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){
    
}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){
    
}