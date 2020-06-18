#macro ANGLE_SCAN_TILTMOVE 5;

//compute next xy position
var _dirMove = point_direction(keyLeft, keyUp, keyRight, keydown);
var xSpeed = mag * lengthdir_x(mag,_dirMove);
var ySpeed = mag * lengthdir_y(mag,_dirMove);
var _xNext = x + xSpeed;
var _yNext = y + ySpeed;

//if collision occur, modify next xy position
if(CollideMap(_xNext,_yNext) || CollideObj(_xNext,_yNext)){
    var _angleCCW = 0;  var _xNextCCW = 0;  var _yNextCCW = 0;  var _iAngleBiasCCW = 9; var _isCollideCCW = false;
    var _angleCW = 0;   var _xNextCW = 0;   var _yNextCW = 0;   var _iAngleBiasCW = 9;  var _isCollideCW = false;
    var _angleNext = _dirMove;
    var _iRollBack = 1;
    
    //compute tilt move boundary, counter-clock wise
    _angleCCW = _dirMove + 45;
    _xNextCCW = x + lengthdir_x(mag,_angleCCW); 
    _yNextCCW = y + lengthdir_y(mag,_angleCCW);
    _isCollideCCW = (CollideMap(_xNextCCW,_yNextCCW)) || (CollideObj(_xNextCCW,_yNextCCW));
    //compute tilt move boundary, clock wise
    _angleCW = _dirMove - 45;
    _xNextCW = x + lengthdir_x(mag,_angleCW); 
    _yNextCW = y + lengthdir_y(mag,_angleCW);
    _isCollideCW = (CollideMap(_xNextCW,_yNextCW)) || (CollideObj(_xNextCW,_yNextCW));
    
    //Able to tilt move, try to tilt
    if ((_isCollideCCW == FALSE)||(_isCollideCW == FALSE)){
        
        //is able to tilt move CCW?
        if (_isCollideCCW == FALSE){  
            _iAngleBiasCCW = 0; _isCollideCCW = TRUE; 

            //scan least angle
            while((_iAngleBiasCCW<=9) || _isCollideCCW){
                _iAngleBiasCCW = _iAngleBiasCCW + 1;
                _angleCCW = _dirMove + (_iAngleBiasCCW * ANGLE_SCAN_TILTMOVE);
                _xNextCCW = x + lengthdir_x(mag, _angleCCW); _yNextCCW = y + lengthdir_y(mag, _angleCCW);
                _isCollideCCW = CollideMap(_xNextCCW,_yNextCCW) || CollideObj(_xNextCCW,_yNextCCW);
            }
            
            //assign to output buffer
            _angleNext = _angleCCW; _xNext = _xNextCCW; _yNext = _yNextCCW;
        }
        
        //is able to tilt move CW?
        if (_isCollideCW == FALSE){  
            _iAngleBiasCW = 0; _isCollideCW = TRUE; 

            //scan least angle
            while((_iAngleBiasCW<=9) || _isCollideCW){
                _iAngleBiasCW = _iAngleBiasCW + 1;
                _angleCW = _dirMove - (_iAngleBiasCW * ANGLE_SCAN_TILTMOVE);
                _xNextCW = x + lengthdir_x(mag, _angleCW); _yNextCW = y + lengthdir_y(mag, _angleCW);
                _isCollideCW = CollideMap(_xNextCW,_yNextCW) || CollideObj(_xNextCW,_yNextCW);
            }
            
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
        _iRollBack = 1;
        
        //approach to edge
        while(CollideMap(_xNext,_yNext) || CollideObj(_xNext,_yNext) || (_iRollBack<=0)){
            _iRollBack = _iRollBack - 0.2;
            
            //roll back x,yNext from collision point
            _xNext = lerp(x,_xNext,_iRollBack);
            _yNext = lerp(y,_yNext,_iRollBack);
        }
    }

    //checking algorithm
    send_debug_message('xNext = ', _xNext);
    send_debug_message('yNext = ', _yNext);
}
//update xy with next xy position
x = _xNext;  y = _yNext;