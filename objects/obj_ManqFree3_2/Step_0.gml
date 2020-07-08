/// @desc 
/// refs:tilt_move_3_2.png

//Get player input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

//compute next xy position
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp !=0);
var _dirMove = point_direction(keyLeft, keyUp, keyRight, keyDown);
var _xSpeed = inputMagnitude * speedWalkX * lengthdir_x(inputMagnitude,_dirMove);
var _ySpeed = inputMagnitude * speedWalkY * lengthdir_y(inputMagnitude,_dirMove);
var _xNext = floor(x + _xSpeed);
var _yNext = floor(y + _ySpeed);

var _xNextCompute = x; var _yNextCompute = y;

if (IS_PLAYER_MOVING){
	
	if(HAS_CHANGE_DIRECTION){ 
		modeMoveEdge = MODE_MOVE_EDGE.SNAP_TO_EDGE; //reset mode, snap to edge
	}
	
	dirMoveLog = _dirMove;
}	
else{}

if(IS_PLAYER_MOVING && CollideMapSolid3(_xNext,_yNext)){
	
	switch(modeMoveEdge){
	case MODE_MOVE_EDGE.TILT_ALONG_EDGE:
		
		//scan CCW
		var _angleCCW = 0;  var _xNextCCW = 0;  var _yNextCCW = 0;  var _iAngleBiasCCW = 0; var _isCollideCCW = true;
		while((_iAngleBiasCCW<=ANGLE_TILE_BOUNDARY) && _isCollideCCW){
		    _iAngleBiasCCW = _iAngleBiasCCW + 1;
		    _angleCCW = _dirMove + (_iAngleBiasCCW * ANGLE_SCANSTEP_TILTMOVE);
		    _xNextCCW = floor(x + lengthdir_x(inputMagnitude * speedWalkX, _angleCCW)); 
			_yNextCCW = floor(y + lengthdir_y(inputMagnitude * speedWalkX, _angleCCW));
		    _isCollideCCW = CollideMapSolid3(_xNextCCW,_yNextCCW);
		}
	
		//scan CW
		var _angleCW = 0;   var _xNextCW = 0;   var _yNextCW = 0;   var _iAngleBiasCW = 0;  var _isCollideCW = true;
		while((_iAngleBiasCW<=ANGLE_TILE_BOUNDARY) && _isCollideCW){
		    _iAngleBiasCW = _iAngleBiasCW + 1;
		    _angleCW = _dirMove - (_iAngleBiasCW * ANGLE_SCANSTEP_TILTMOVE);
		    _xNextCW = floor(x + lengthdir_x(inputMagnitude * speedWalkX, _angleCW)); 
			_yNextCW = floor(y + lengthdir_y(inputMagnitude * speedWalkX, _angleCW));
		    _isCollideCW = CollideMapSolid3(_xNextCW,_yNextCW);
		}
	
		if((_iAngleBiasCCW>=ANGLE_TILE_BOUNDARY)&&(_iAngleBiasCW>=ANGLE_TILE_BOUNDARY)){ //unable to tilt, try snap
			//modeMoveEdge = MODE_MOVE_EDGE.SNAP_TO_EDGE;
			_xNext = x; _yNext = y;
			break;
		}
		else{ //able to tilt, tilt
			
			//tilt with least angle
			if(_iAngleBiasCCW<=_iAngleBiasCW){
				_xNext = _xNextCCW; _yNext = _yNextCCW;	SHOW_MSG_TILT
			}
			else{
				_xNext = _xNextCW; _yNext = _yNextCW; SHOW_MSG_TILT
			}
			
			break;
		}
		
	case MODE_MOVE_EDGE.SNAP_TO_EDGE:
		
		//approach to edge
		var _iStepSnap = 0; //var _xNextCompute = x; var _yNextCompute = y;
		
		//roll foward to edge
		for(var _iStepSnap = 0; _iStepSnap <= 1.0; _iStepSnap = _iStepSnap + 0.01;)
		{
			_xNextCompute = floor(lerp(x,_xNext,_iStepSnap));
	        _yNextCompute = floor(lerp(y,_yNext,_iStepSnap));
			if (CollideMapSolid3(_xNextCompute,_yNextCompute)){	break;}
			else{}
		}
		
		//roll backward from edge to insure not collide
		while(CollideMapSolid3(_xNextCompute,_yNextCompute)){
			_iStepSnap = _iStepSnap * 0.9;
			_xNextCompute = floor(lerp(x,_xNext,_iStepSnap));
	        _yNextCompute = floor(lerp(y,_yNext,_iStepSnap));
		}

		_xNext = _xNextCompute; 
		_yNext = _yNextCompute;
		
		modeMoveEdge = MODE_MOVE_EDGE.TILT_ALONG_EDGE; SHOW_MSG_SNAP3_2
		break;
	
	default: break;
	}
}
else{}

//checking algorithm
if(CollideMapSolid3(x,y)){show_error("Illegal Position: STUCK x y",true);}
if(CollideMapSolid3(_xNextCompute,_yNextCompute)){show_error("Illegal Position: NextCompute", true);}
if(CollideMapSolid3(_xNext,_yNext)){show_error("Illegal Position: Next", true);}

//update xy with next xy position
x = _xNext;  y = _yNext;