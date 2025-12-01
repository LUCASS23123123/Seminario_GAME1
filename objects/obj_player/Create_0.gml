spd = 5;
hspd = 0;
vspd = 0;
grv = 0.4;
shoot_timer = 0;
shoot_frame = 3; // frame exato onde o tiro sai (ajuste)
shot_fired = false; // garante que só atira UMA vez por animação

global.bullets = 5;
global.life = 8;
image_speed = 0.4;

state = PlayerState.FREE;
enum PlayerState {
FREE,
FREEZE
}
// Inicializar controles mobile
global.touch_right = false;
global.touch_left  = false;
global.touch_jump  = false;
global.touch_shoot = false;
