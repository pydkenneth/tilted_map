///@desc GetPosMaskSelf()
///@arg x
///@arg y
//refs: GetPosMask.png
var _x = argument0;
var _y = argument1;
xp = bbox_right ;//+ _x - sprite_xoffset;
xn = bbox_left	;//+ _x - sprite_xoffset;
yn = bbox_top	;//+ _y - sprite_yoffset;
yp = bbox_bottom;//+ _y - sprite_yoffset;
x0 = (xn + xp) / 2;
y0 = (yn + yp) / 2;

//put values to arrty
xBbox[0] = xp; yBbox[0] = y0;
xBbox[1] = xp; yBbox[1] = yp;
xBbox[2] = x0; yBbox[2] = yp;
xBbox[3] = xn; yBbox[3] = yp;
xBbox[4] = xn; yBbox[4] = y0;
xBbox[5] = xn; yBbox[5] = yn;
xBbox[6] = x0; yBbox[6] = yn;
xBbox[7] = xp; yBbox[7] = yn;