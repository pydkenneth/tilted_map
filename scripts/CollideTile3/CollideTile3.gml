///@desc CollideTile()
///@arg collisionTile
///@arg x
///@arg y
var _collisionTile = argument0;
var _x = argument1;
var _y = argument2;
var _collision = false;

//determine if collide
if(tilemap_get_at_pixel(_collisionTile, _x, _y)){_collision = true;}
else{_collision = false;}

return _collision;