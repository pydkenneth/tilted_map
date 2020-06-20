///@desc CollideObj

//if 8 points collide with obj_collide
if(!place_free(xp,y0)){
	instance_create_layer(xp,y0,"Instances_1",obj_cross);
	return true;}
if(!place_free(xp,yp)){
	instance_create_layer(xp,yp,"Instances_1",obj_cross);
	return true;}
if(!place_free(x0,yp)){
	instance_create_layer(x0,yp,"Instances_1",obj_cross);
	return true;}
if(!place_free(xn,yp)){
	instance_create_layer(xn,yp,"Instances_1",obj_cross);
	return true;}
if(!place_free(xn,y0)){
	instance_create_layer(xn,y0,"Instances_1",obj_cross);
	return true;}
if(!place_free(xn,yn)){
	instance_create_layer(xn,yn,"Instances_1",obj_cross);
	return true;}
if(!place_free(x0,yn)){
	instance_create_layer(x0,yn,"Instances_1",obj_cross);
	return true;}
if(!place_free(xp,yn)){
	instance_create_layer(xp,yn,"Instances_1",obj_cross);
	return true;}
return false;