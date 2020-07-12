///@desc CollideMapSolid3()
///@arg position
///@arg til_Collision
var _x = argument0[0];
var _y = argument0[1];

//Get 8 positions around mask of self
//GetPosMaskSelf(_x,_y);

//determine collision
if(CollideObj3(_x,_y)){
	
	//show_debug_message("Bump: OBJ of obj_Collision");  
	return IS_COLLIDE;

}else if(CollideTile3(sys_Collision.gridmapCollisionTile, _x, _y)){
	
	//show_debug_message("Bump: TILE of solid map"); 
	return IS_COLLIDE;

}else{
	
	return NOT_COLLIDE;
}