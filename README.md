# Snapper-Sketch
taking photos by snapper your finger.

# Background
This project is an assignment of Authoring class. It is a kind of Camera to take photos when user snap their finger or make some sounds. This application uses functions tought on the class and make us fully understand how to coding in Processing way.

Goals:
Taking photo when user snap their finger or make some sounds. 

# Instal
From GitHub 
https://github.com/ZhouSiyun/Snapper-Sketch/edit/master/README.md

# Environment dependence
Processing (3)

# Usage
1. Run the project.
2. snap your finger or make some sounds.
3. if your photo was saved, you will see the message "photo saved!" on the screen.

# Licence
None

# Introduction of Functions
void startCamera():
this is the first function which is apparently used to start the camera.

void startAudio():
this function is used to make sounds accessible. So that we can analysis the sound to reach our need of taking a photo when there is a finger snap or other sounds.

void captureEvent(Capture cam):
make the camera start shooting images.

void savePic(Capture cam, float size):
this function is used to save pictures, the name of the picture is used the order of the number. 
The first picture is called pic1.jpg. 

void savePicInfo(int count):
Save the message that how many photos are already took. In this part we saved the message as a .txt format file.
(why i didn't use json is because json is more complicated than txt and in this project txt is enough.)

int getCount():
This function is used to in case over write the picture already existed in the folder. By reading the count.txt, it can easily get the number of pictures last time we run the program. 






