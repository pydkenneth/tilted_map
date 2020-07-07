///@desc CollideObj
///@arg x
///@arg y
var _x = argument0; var _y = argument1;
if(place_meeting(_x, _y, obj_Collision)){
	return true;
}
else{
	return false;
}