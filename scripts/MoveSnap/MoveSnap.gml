///@desc MoveSnap()
///@arg posCurrent
///@arg posNext

var _posCurrent = argument0;    var _posNext = argument1;		

var _i_snap = 0;
var _posNextSnapX = [0];    var _posNextSnapY = [0];

//roll foward to edge
var _iStepSnap = 0;
while(true){
	_posNextSnapX[_i_snap] = round(lerp(_posCurrent[ID_X], _posNext[ID_X], _iStepSnap));
	_posNextSnapY[_i_snap] = round(lerp(_posCurrent[ID_Y], _posNext[ID_Y], _iStepSnap));
	var _posNextSnapXY = [ _posNextSnapX[_i_snap] , _posNextSnapY[_i_snap] ];
	if (CollideMapSolid3(_posNextSnapXY)){ break; }
	
	_iStepSnap = _iStepSnap + SNAP_APPROACH_STEP;
	_i_snap = _i_snap +1;
}

//roll back a little bit
var _posSnapRollBack = [ _posNextSnapX[_i_snap-1] , _posNextSnapY[_i_snap-1] ];

return _posSnapRollBack;