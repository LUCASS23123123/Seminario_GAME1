spd = 5;
hspd = 0;
vspd = 0;
grv = 0.4;
shoot_timer = 0;
shoot_frame = 3; // frame exato onde o tiro sai (ajuste)
shot_fired = false; // garante que só atira UMA vez por animação

global.bullets = 3000;
global.life = 4;
image_speed = 0.4;

state = PlayerState.FREE;
enum PlayerState {
FREE,
FREEZE
}