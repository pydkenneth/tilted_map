/// @desc 
//Get player input
keyLeft = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
keyRight = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

//Compute movement
var _keyY = keyDown-keyUp;
inputDirection = point_direction(0,0,(keyRight-keyLeft),_keyY);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp !=0);
ySpeed = speedWalkY*inputMagnitude*_keyY;
xSpeed = (speedWalkX*inputMagnitude*(keyRight-keyLeft)) + (ySpeed*global.TILT_CONST);


//Update position, sprite
x+=xSpeed;  y+=ySpeed;
if(keyLeft||keyRight||keyUp||keyDown){image_index = round(inputDirection/90);}