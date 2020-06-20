///@desc GetPosMaskSelf()
///@arg x
///@arg y
//refs: GetPosMask.png
var _x = argument0;
var _y = argument1;
xp = bbox_right ;//+ _x - sprite_xoffset;
xn = bbox_left	;//+ _x - sprite_xoffset;
yp = bbox_top	;//+ _y - sprite_yoffset;
yn = bbox_bottom;//+ _y - sprite_yoffset;
x0 = (xn + xp) / 2;
y0 = (yn + yp) / 2;