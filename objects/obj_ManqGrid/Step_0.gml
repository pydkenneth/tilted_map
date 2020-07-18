/// @desc 
GetPlayerInput_Grid();

//Compute movement, ref:tilt_grid.png
var _keyY = keyDown-keyUp;    var _keyX = keyRight-keyLeft;
var _ySpeed = speedWalkY * inputMagnitude * _keyY;
var _xSpeed = (speedWalkX * inputMagnitude * _keyX) 
			+ (_ySpeed * global.TILT_CONST);    //Tilt in x direction when move along y axis

//Update position
x += _xSpeed;  y += _ySpeed;

//update sprite
var _inputDirection = point_direction(0, 0, _keyX, _keyY);
if(keyLeft||keyRight||keyUp||keyDown){ image_index = round(_inputDirection/90); }