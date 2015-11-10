#include "ofApp.h"
int colorCounter;
int colorCounter2;
bool mouseOnRight;
int x = 0;
int y = ofGetHeight()/2;
int state = 0;
int speed = 3;

//--------------------------------------------------------------
void ofApp::setup(){
    colorCounter = 0;
    colorCounter2 = 0;
    mouseOnRight = false;
}

//--------------------------------------------------------------
void ofApp::update(){
    if(state == 0){
        x = x + speed;
        y = y - speed;
        
        if(y < 0){
            x = ofGetWidth()/2;
            state = 1;
        }
    }else if(state == 1){
        x = x + speed;
        y = y + speed;
        
        if(x > ofGetWidth()){
            y = ofGetHeight()/2;
            state = 2;
        }
    }else if(state == 2){
        x = x - speed;
        y = y + speed;
        
        if(y > ofGetHeight()){
            x = ofGetWidth()/2;
            state = 3;
        }
    }else if(state == 3){
        x = x - speed;
        y = y - speed;
        
        if(x < 0){
            y = ofGetHeight()/2;
            state = 0;
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofBackground(100+colorCounter, 100-colorCounter, 100+colorCounter);
    ofSetColor(colorCounter2, colorCounter2, colorCounter2);
    ofFill();
    ofEllipse(x, y, 40, 40);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){
    if(y >= ofGetHeight()/2 && mouseOnRight == false){
        mouseOnRight = true;
        colorCounter += 5;
        speed += 3;
    }
    if(y <= ofGetHeight()/2 && mouseOnRight == true){
        mouseOnRight = false;
        colorCounter2 += 5;
        speed -= 3;
    }
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

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