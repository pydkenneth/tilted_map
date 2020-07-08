/// @desc TileLayer2Grid(layerTile,gridmapReturn);
/// @arg layerTile
/// @arg gridmapReturn

var _gridmapReturn = argument1;
var _layerTile = argument0;
var _lay_id = layer_get_id(_layerTile);
var _map_id = layer_tilemap_get_id(_lay_id);

//transform tilelayer into ds_grid
for(var _ix = 0; _ix<= room_width-1; _ix++;){
	for(var _iy = 0; _iy<= room_height-1; _iy++;){
		ds_grid_set(_gridmapReturn, _ix, _iy, tilemap_get_at_pixel(_map_id,_ix,_iy));
	}
}