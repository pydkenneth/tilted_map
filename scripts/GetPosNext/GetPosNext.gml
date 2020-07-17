///@desc GetPosNext()
var _dirMove = point_direction(keyLeft, keyUp, keyRight, keyDown);
var _xSpeed = inputMagnitude * speedWalkX * lengthdir_x(inputMagnitude,_dirMove);
var _ySpeed = inputMagnitude * speedWalkY * lengthdir_y(inputMagnitude,_dirMove);

var _posNext = [ x + _xSpeed, y + _ySpeed ];

return _posNext;