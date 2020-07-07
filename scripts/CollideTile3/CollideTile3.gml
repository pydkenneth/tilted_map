///@desc CollideTile3()
///@arg gridmapCollision
///@arg x
///@arg y
var _gridmapCollision = argument0;
var _x = argument1;
var _y = argument2;

//put collision map into grid
//......code is moved to sys_Collision

//compute area of bbox according x,y
var _lastX = x; var _lastY = y;
x = _x; y = _y;
var _BottomObj	= floor(bbox_bottom); //get area from projection of obj on layer
var _LeftObj	= floor(bbox_left);
var _RightObj	= floor(bbox_right);
var _TopObj		= floor(bbox_top);
x = _lastX; y = _lastY; //move obj back to orginal position

//pick area from grid, compute how many pixels collided
var _valueCollide = ds_grid_get_sum(_gridmapCollision, _LeftObj, _TopObj, _RightObj, _BottomObj);

//determine if collide
if(_valueCollide == 0){
	return NOT_COLLIDE;
}
else{
	return IS_COLLIDE;
}