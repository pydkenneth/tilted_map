/// @desc refs:tilt_move_3_2.png

GetPlayerInput();
var _posCurrent = [x,y];
var _posNext = GetPosNext();  //[x,y]
var _phaseMethodMove = MODE_MOVE_EDGE.SNAP_TO_EDGE;

if(IS_PLAYER_MOVING && CollideMapSolid3(_posNext)){

	switch (_phaseMethodMove){
	case MODE_MOVE_EDGE.SNAP_TO_EDGE:
		var _posSnap = MoveSnap(_posCurrent, _posNext);
		
		var _ableSnap = !array_equals(_posCurrent, _posSnap);
		if (_ableSnap) { 
			
			show_debug_message("Snap: " 
			+ "x: " + string(x) 
			+ ", y: " + string(y) 
			+ " _xNext: " + string(_posNext[ID_X]) 
			+ ", _yNext: " + string(_posNext[ID_Y]) 
			+ " _xSnap: " + string(_posSnap[ID_X]) 
			+ ", _ySnap: " + string(_posSnap[ID_Y]) 
			);
			
			_posNext = _posSnap; 
			break;
		}
		else{ 
			// try tilt along edge 
		}
		
	case MODE_MOVE_EDGE.TILT_ALONG_EDGE:
		
		var _posTilt = MoveTilt(_posCurrent, _posNext); 
		_posNext = _posTilt;
	
	default:    break;
	}
}
else{
	
}


//update xy with next xy position
x = _posNext[ID_X];  y = _posNext[ID_Y];


//checking algorithm
if(CollideMapSolid3(_posCurrent)){show_error("Illegal Position: STUCK x y",true);}
//if(CollideMapSolid3(_posNext[ID_X]Compute,_posNext[ID_Y]Compute)){show_error("Illegal Position: NextCompute", true);}
if(CollideMapSolid3(_posNext)){show_error("Illegal Position: Next", true);}
