///@desc MoveTilt()
///@arg _posCurrent
///@arg _posNext
var _posCurrent = argument0;    var _posNext = argument1;

//scan CCW
var _angleScanStepCCW = ANGLE_SCANSTEP_TILTMOVE;
var _posCCW = ScanAngleTilt(_posCurrent, _posNext, _angleScanStepCCW);
	
//scan CW
var _angleScanStepCW = -(ANGLE_SCANSTEP_TILTMOVE);
var _posCW = ScanAngleTilt(_posCurrent, _posNext, _angleScanStepCW);

//tilt move
var _posTilt = _posCurrent; //var for output
if((_posCCW[ID_AbleTilt] == UNABLE) &&( _posCW[ID_AbleTilt] == UNABLE)){ 
	
	//unable to tilt, stay
	_posTilt = _posCurrent;
}
else{ 
	
	//able to tilt, //tilt with least rotation
	var _angleNext = point_direction(_posCurrent[ID_X], _posCurrent[ID_Y], _posNext[ID_X], _posNext[ID_Y]);
	var _angleTiltCCW = abs(angle_difference(_angleNext, _posCCW[ID_AngleTilt])); 
	var _angleTiltCW  = abs(angle_difference(_angleNext, _posCW[ID_AngleTilt]));
	if(_angleTiltCCW <= _angleTiltCW){ _posTilt = _posCCW; 	}
	else{ _posTilt = _posCW; }
}

//output position
return _posTilt;