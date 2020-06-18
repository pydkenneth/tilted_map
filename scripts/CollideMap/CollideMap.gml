///@desc CollideMap()
///@arg collisionMap
///@arg x
///@arg y
var _collisionMap = argument0;
var _x = argument1;
var _y = argument2;
var _collision = false;

//determine if collide
if(tilemap_get_at_pixel(_collisionMap, _x, _y)){_collision = true;}
else{_collision = false;}

//var _tilmapReturn = tilemap_get_at_pixel(_collisionMap, _x, _y);
//show_debug_message("_tilmapReturn " + string(_tilmapReturn));
//show_debug_message("_collision " + string(_collision));

return _collision;