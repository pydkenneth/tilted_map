/// @desc refs:tilt_move_3_2.png

GetPlayerInput();
var _posCurrent = [x,y];
var _posNext = GetPosNext();  //[x,y]
var _phaseMethodMove = MODE_MOVE_EDGE.SNAP_TO_EDGE;

if(IS_PLAYER_MOVING && CollideMapSolid3(_posNext)){
	
	var _posSnap = MoveSnap(_posCurrent, _posNext);
		
	if (!array_equals(_posCurrent, _posSnap)) { 
		
		//update next position
		_posNext = _posSnap; 
	}
	else{
		
		// try tilt along edge
		var _posTilt = MoveTilt(_posCurrent, _posNext); 
		_posNext = _posTilt;
	}  
}
else{}

//update xy with next xy position
x = _posNext[ID_X];  y = _posNext[ID_Y];

////Position Check for safety
////checking algorithm
//if(CollideMapSolid3(_posCurrent)){show_error("Illegal Position: STUCK x y",true);}
////if(CollideMapSolid3(_posNext[ID_X]Compute,_posNext[ID_Y]Compute)){show_error("Illegal Position: NextCompute", true);}
//if(CollideMapSolid3(_posNext)){show_error("Illegal Position: Next", true);}