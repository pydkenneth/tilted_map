#macro ANGLE_SCANSTEP_TILTMOVE 1
#macro ANGLE_TILE_BOUNDARY 50
#macro TILE_COLLISION "TileCollision"
#macro IS_COLLIDE true
#macro NOT_COLLIDE false

#macro ABLE true
#macro UNABLE false

#macro IS_PLAYER_MOVING (inputMagnitude>0)

#macro SNAP_APPROACH_STEP 0.1

enum MODE_MOVE_EDGE{
	TILT_ALONG_EDGE = 0,
	SNAP_TO_EDGE =1
}

#macro ID_X 0
#macro ID_Y 1
#macro ID_AbleTilt 2
#macro ID_AngleTilt 3