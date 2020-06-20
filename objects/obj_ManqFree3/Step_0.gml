/// @desc 

//Get player input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

//compute next xy position
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp !=0);

var _dirMove = point_direction(keyLeft, keyUp, keyRight, keyDown);
//show_debug_message("_dirMove = " + string(_dirMove));  //db20200617

var _xSpeed = inputMagnitude * speedWalkX * lengthdir_x(inputMagnitude,_dirMove);
var _ySpeed = inputMagnitude * speedWalkY * lengthdir_y(inputMagnitude,_dirMove);
var _xNext = x + _xSpeed;
var _yNext = y + _ySpeed;

//if collision occur, modify next xy position
if(CollideSolidMap3(_xNext,_yNext)){
	var _angleCCW = 0;  var _xNextCCW = 0;  var _yNextCCW = 0;  var _iAngleBiasCCW = 0; var _isCollideCCW = true;
	var _angleCW = 0;   var _xNextCW = 0;   var _yNextCW = 0;   var _iAngleBiasCW = 0;  var _isCollideCW = true;
	var _angleNext = _dirMove;
	var _iRollBack = 1;
    
	//scan CCW
	while((_iAngleBiasCCW<=ANGLE_TILE_BOUNDARY) && _isCollideCCW){
	    _iAngleBiasCCW = _iAngleBiasCCW + 1;
	    _angleCCW = _dirMove + (_iAngleBiasCCW * ANGLE_SCAN_TILTMOVE);
	    _xNextCCW = x + lengthdir_x(inputMagnitude * speedWalkX, _angleCCW); 
		_yNextCCW = y + lengthdir_y(inputMagnitude * speedWalkX, _angleCCW);
	    _isCollideCCW = CollideSolidMap3(_xNextCCW,_yNextCCW);
	}
	
	//scan CW
	while((_iAngleBiasCW<=ANGLE_TILE_BOUNDARY) && _isCollideCW){
	    _iAngleBiasCW = _iAngleBiasCW + 1;
	    _angleCW = _dirMove - (_iAngleBiasCW * ANGLE_SCAN_TILTMOVE);
	    _xNextCW = x + lengthdir_x(inputMagnitude * speedWalkX, _angleCW); 
		_yNextCW = y + lengthdir_y(inputMagnitude * speedWalkX, _angleCW);
	    _isCollideCW = CollideSolidMap3(_xNextCW,_yNextCW);
	}
	
	if((_iAngleBiasCCW>=ANGLE_TILE_BOUNDARY)&&(_iAngleBiasCW>=ANGLE_TILE_BOUNDARY)){  //if CCW = +50, CW = -50, unable to tilt
		
		//approach to edge
		while(CollideSolidMap3(_xNext,_yNext)&& (_iRollBack>=0)){
	        _iRollBack = _iRollBack - 0.1;
            
	        //roll back x,yNext from collision point
	        _xNext = lerp(x,_xNext,_iRollBack);
	        _yNext = lerp(y,_yNext,_iRollBack);
	    }
		if(_iRollBack < 0){_iRollBack = 0; _xNext = x; _yNext = y;}
		show_debug_message("approaching: " 
		+ "_xNext" + string(_xNext)
		+ ", _yNext" + string(_yNext)
		+ ", _iRollBack" + string(_iRollBack)
		);
	}else{  
		
		//tilt with least angle
		if(_iAngleBiasCCW<=_iAngleBiasCW){
			_xNext = _xNextCCW; _yNext = _yNextCCW;
			
			show_debug_message("tilting: " 
			+ "_angleNext: " + string(_angleNext)
			+ ", _angleCCW: " + string(_angleCCW)
			+ ", _xNext" + string(_xNext)
			+ ", _yNext" + string(_yNext)
			);
		}
		else{
			_xNext = _xNextCW; _yNext = _yNextCW;
		}
	}
		
	//checking algorithm
	if(CollideSolidMap3(_xNext,_yNext)){show_error("Illegal Position: Collide Solid Map", true);}
}

//update xy with next xy position
x = _xNext;  y = _yNext;

