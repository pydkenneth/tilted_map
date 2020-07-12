#macro ANGLE_SCAN_TILTMOVE 5
#macro ANGLE_SCANSTEP_TILTMOVE 5
#macro ANGLE_TILE_BOUNDARY 15
#macro TILE_COLLISION "TileCollision"
#macro IS_COLLIDE true
#macro NOT_COLLIDE false

#macro ABLE true
#macro UNABLE false

#macro IS_PLAYER_MOVING (inputMagnitude>0)
#macro HAS_CHANGE_DIRECTION (dirMoveLog != _dirMove)

enum MODE_MOVE_EDGE{
	TILT_ALONG_EDGE = 0,
	SNAP_TO_EDGE =1
}

#macro ID_X 0
#macro ID_Y 1

#macro SHOW_MSG_TILT show_debug_message("tilting: " \
				+ "_angleNext: " + string(_angleNext) \
				+ ", _angleTilt: " + string(_angleTilt) \
				+ ", _xNext" + string(_xNext) \
				+ ", _yNext" + string(_yNext) \
				);
				
#macro SHOW_MSG_SNAP show_debug_message("approaching: " \
		+ "x: " + string(x) \
		+ ", y: " + string(y) \
		+ " _xNext: " + string(_xNext) \
		+ ", _yNext: " + string(_yNext) \
		+ ", _iRollBack: " + string(_iRollBack) \
		);
		
#macro SHOW_MSG_SNAP3_2 show_debug_message("approaching: " \
		+ "x: " + string(x) \
		+ ", y: " + string(y) \
		+ " _xNext: " + string(_xNext) \
		+ ", _yNext: " + string(_yNext) \
		+ ", bbox_bottom: " + string(bbox_bottom) \
		);