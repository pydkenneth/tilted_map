///@desc CollideObj

////if 8 points collide with obj_collide
//for (var i_points = 0; i_points < 8; ++i_points) {
//	if(place_meeting(xBbox[i_points],yBbox[i_points],obj_Collision64x64)){
//	//if(!place_free(xBbox[i_points],yBbox[i_points])){
//		instance_destroy(obj_cross_mini);
//		instance_create_layer(xBbox[i_points], yBbox[i_points],"Instances_debug", obj_cross_mini);
//		show_debug_message("BUMP: "+string(i_points));
//		return true;
//	}
//	else{
//		instance_destroy(obj_cross_mini);
//		return false;
//	}
//}

//if 8 points collide with obj_collide
var _isCollide = false;
instance_destroy(obj_cross_mini);

/*
for (var i_points = 0; i_points < 8; ++i_points) {
	if(place_meeting(xBbox[i_points],yBbox[i_points],obj_Collision64x64)){
	//if(!place_free(xBbox[i_points],yBbox[i_points])){

		instance_create_layer(xBbox[i_points], yBbox[i_points],"Instances_debug", obj_cross_mini);
		_isCollide = true;
	}

}
*/



if(_isCollide) {return true;}
else {return false;}


//if(!place_free(xp,y0)){
//	show_debug_message("BUMP: right");
//	return true;}
//if(!place_free(xp,yn)){
//	show_debug_message("BUMP: right, up");
//	return true;}
//if(!place_free(x0,yn)){
//	show_debug_message("BUMP: up");
//	return true;}
//if(!place_free(xn,yn)){
//	show_debug_message("BUMP: left, up");
//	return true;}
//if(!place_free(xn,y0)){
//	show_debug_message("BUMP: left");
//	return true;}
//if(!place_free(xn,yp)){
//	show_debug_message("BUMP: left down");
//	return true;}
//if(!place_free(x0,yp)){
//	show_debug_message("BUMP: down");
//	return true;}
//if(!place_free(xp,yp)){
//	show_debug_message("BUMP: right down");
//	return true;}
//return false;