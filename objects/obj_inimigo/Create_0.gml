// create
hp = 3;

walk_speed = 1;
chase_speed = 1;
vspd = 0;
hspd = walk_speed;

state = "idle"; // idle, patrol, chase, attack, hurt, dead
death_invulnerable = false; 
death_timer = 0;

image_xscale = choose(-1, 1);

attack_timer = 0;
hurt_timer = 0;

player = noone;

// Tilemap
tile_asfalto = layer_tilemap_get_id("Tile_Asfalto");
