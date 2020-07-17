///@desc ScanAngleTilt()
///@arg posCurrent
///@arg posNext
///@arg angleScanStep

//output : _posTilt = [_posNextTilt[ID_X], _posNextTilt[ID_Y], _ableTilt, _angleTilt];

//deal with inputs
var _posCurrent = argument0;
var _posNext = argument1;

//choose the calculus method for differe
var _dirMove = point_direction(_posCurrent[ID_X], _posCurrent[ID_Y], _posNext[ID_X], _posNext[ID_Y]);
var _disMove = point_distance (_posCurrent[ID_X], _posCurrent[ID_Y], _posNext[ID_X], _posNext[ID_Y]);
var _angleScanStep = argument2;

//scan Clock-Wise / Counter Clock-Wise
var _iAngleBiasTilt = 0; 
var _isCollideTilt = IS_COLLIDE;
var _angleTilt = 0;
var _posNextTilt = _posCurrent;
var _ableTilt = UNABLE;

while((_iAngleBiasTilt <= ANGLE_TILE_BOUNDARY) && (_isCollideTilt == IS_COLLIDE)){
	_iAngleBiasTilt = _iAngleBiasTilt + 1;
	
	_angleTilt = _dirMove + (_iAngleBiasTilt * _angleScanStep);
	
	_posNextTilt[ID_X] = floor(_posCurrent[ID_X] + lengthdir_x(_disMove, _angleTilt)); 
	_posNextTilt[ID_Y] = floor(_posCurrent[ID_Y] + lengthdir_y(_disMove, _angleTilt));
	_isCollideTilt = CollideMapSolid3(_posNextTilt);
}


if (_iAngleBiasTilt > ANGLE_TILE_BOUNDARY){
	
	//stay for exceed scanning boundary
	_posNextTilt[ID_X] = _posCurrent[ID_X]; 
	_posNextTilt[ID_Y] = _posCurrent[ID_Y];
	_ableTilt = UNABLE;
}
else{
	
	//allow tilt
	_ableTilt = ABLE;
}

//output result
var _posTilt = [_posNextTilt[ID_X], _posNextTilt[ID_Y], _ableTilt, _angleTilt];
return _posTilt;