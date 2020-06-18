/// @desc 
//#macro ANGLE_SCAN_TILTMOVE 5
//Get player input
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

//compute next xy position
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp !=0);
if(inputMagnitude){
	var _dirMove = point_direction(keyLeft, keyUp, keyRight, keyDown);
	//show_debug_message("_dirMove = " + string(_dirMove));  //db20200617

	var _xSpeed = inputMagnitude * speedWalkX * lengthdir_x(inputMagnitude,_dirMove);
	var _ySpeed = inputMagnitude * speedWalkY * lengthdir_y(inputMagnitude,_dirMove);
	var _xNext = x + _xSpeed;
	var _yNext = y + _ySpeed;
	
	var _condition = 0;  //db
	
	//if collision occur, modify next xy position
	if((CollideTile(colMap,_xNext,_yNext))   || (CollideObj(_xNext,_yNext,obj_Collision64x64))){
	    var _angleCCW = 0;  var _xNextCCW = 0;  var _yNextCCW = 0;  var _iAngleBiasCCW = 9; var _isCollideCCW = false;
	    var _angleCW = 0;   var _xNextCW = 0;   var _yNextCW = 0;   var _iAngleBiasCW = 9;  var _isCollideCW = false;
	    var _angleNext = _dirMove;
	    var _iRollBack = 1;
    
	    //compute tilt move boundary, counter-clock wise
	    _angleCCW = _dirMove + 45;
	    _xNextCCW = x + lengthdir_x(inputMagnitude * speedWalkX,_angleCCW); 
	    _yNextCCW = y + lengthdir_y(inputMagnitude * speedWalkX,_angleCCW);
	    _isCollideCCW = (CollideTile(colMap,_xNextCCW,_yNextCCW)) || (CollideObj(_xNextCCW,_yNextCCW,obj_Collision64x64));
		//show_debug_message("_isCollideCCW=" + string(_isCollideCCW)); //db
	    //compute tilt move boundary, clock wise
	    _angleCW = _dirMove - 45;
	    _xNextCW = x + lengthdir_x(inputMagnitude * speedWalkX,_angleCW); 
	    _yNextCW = y + lengthdir_y(inputMagnitude * speedWalkX,_angleCW);
	    _isCollideCW = (CollideTile(colMap,_xNextCW,_yNextCW)) || (CollideObj(_xNextCW,_yNextCW,obj_Collision64x64));
		show_debug_message("_dirMove= " + string(_dirMove) 
		+ "  _angleCW= " + string(_angleCW) 
		+ "  y= " + string(y) 
		+ "  _yNextCW= " + string(_yNextCW)
		+ "  inputMagnitude= " + string(inputMagnitude)
		); //db
		show_debug_message("_isCollideCW= " + string(_isCollideCW)); //db
    
		
	    //Able to tilt move, try to tilt
		
		/*
		
	    if ((_isCollideCCW == false)||(_isCollideCW == false)){
			_condition = 1;
			
		
	        //is able to tilt move CCW?
	        if (_isCollideCCW == false){  
	            _iAngleBiasCCW = 0; _isCollideCCW = true; 

	            //scan least angle
	            while((_iAngleBiasCCW<=9) && _isCollideCCW){
	                _iAngleBiasCCW = _iAngleBiasCCW + 1;
	                _angleCCW = _dirMove + (_iAngleBiasCCW * ANGLE_SCAN_TILTMOVE);
	                _xNextCCW = x + lengthdir_x(inputMagnitude * speedWalkX, _angleCCW); 
					_yNextCCW = y + lengthdir_y(inputMagnitude * speedWalkX, _angleCCW);
	                _isCollideCCW = CollideMap(colMap,_xNextCCW,_yNextCCW)  ;// || CollideObj(_xNextCCW,_yNextCCW);
	            }
            
				//if(_isCollideCCW){show_error("ERR: CAL CCW", true);}  //db
	            //show_debug_message("_isCollideCCW " + string(_isCollideCCW));  //db20200617
				//show_debug_message("_dirMove = " + string(_dirMove));  //db20200617
			
				//assign to output buffer
	            _angleNext = _angleCCW; _xNext = _xNextCCW; _yNext = _yNextCCW;
	        }
        
	        //is able to tilt move CW?
	        if (_isCollideCW == false){  
	            _iAngleBiasCW = 0; var _isCollideCW2 = true; 

	            //scan least angle
	            while((_iAngleBiasCW<=9) && _isCollideCW2){
	                _iAngleBiasCW = _iAngleBiasCW + 1;
	                _angleCW = _dirMove - (_iAngleBiasCW * ANGLE_SCAN_TILTMOVE);
	                _xNextCW = x + lengthdir_x(inputMagnitude * speedWalkX, _angleCW); 
					_yNextCW = y + lengthdir_y(inputMagnitude * speedWalkX, _angleCW);
	                _isCollideCW2 = CollideMap(colMap,_xNextCW,_yNextCW) ;//|| CollideObj(_xNextCW,_yNextCW);
	            }
	            if(_yNextCW < y){show_error("ERR: CAL CW", true);}  //db
			
				if(CollideMap(colMap,_xNextCW,_yNextCW)){show_error("ERR: CAL CW", true);}  //db
	            //show_debug_message("_isCollideCW2 " + string(_isCollideCW2));  //db20200617
				//show_debug_message("_dirMove = " + string(_dirMove));  //db20200617
				//show_debug_message("_angleCW = " + string(_angleCW));  //db20200617
				//show_debug_message("_iAngleBiasCW = " + string(_iAngleBiasCW));  //db20200617			
			
	            //assign to output buffer
	            _angleNext = _angleCW; _xNext = _xNextCW; _yNext = _yNextCW;
	        }
        
	        //output smaller angle with x, y
	        if (_iAngleBiasCCW <= _iAngleBiasCW){
        
	            //override output buffer
	            _angleNext = _angleCCW; _xNext = _xNextCCW; _yNext = _yNextCCW;
	        }
	    }
	    else{  //NOT able to tilt move
		*/
	        _condition = 2;
			_iRollBack = 1;
        
	        //approach to edge
	        while(CollideTile(colMap,_xNext,_yNext) && (_iRollBack>=0) || CollideObj(_xNext,_yNext,obj_Collision64x64)){
	            _iRollBack = _iRollBack - 0.1;
            
	            //roll back x,yNext from collision point
	            _xNext = lerp(x,_xNext,_iRollBack);
	            _yNext = lerp(y,_yNext,_iRollBack);
	        }
	    
		/*
		}
		*/
		
	    //checking algorithm

	}
	//update xy with next xy position
	x = _xNext;  y = _yNext;
	show_debug_message("_condition= " + string(_condition)); //db
}