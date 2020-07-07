///@desc CollideMapSolid3()
///@arg x
///@arg y
///@arg til_Collision
var _x = argument0;
var _y = argument1;
//var _tile_Collision = argument2;

//Get 8 positions around mask of self
//GetPosMaskSelf(_x,_y);

//determine collision
if(CollideObj3(_x,_y)){
	show_debug_message("Bump: OBJ of obj_Collision");  
	return true;
/*}else if(CollideTile3()){
	show_debug_message("Bump: TILE of solid map"); 
	return true;*/
}else{
	return false;
}