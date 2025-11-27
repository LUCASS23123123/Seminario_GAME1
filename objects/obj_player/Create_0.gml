spd = 5;
hspd = 0;
vspd = 0;
grv = 0.4;
shoot_timer = 0;
global.bullets = 30;
global.life = 4;
image_speed = 0.4;

state = PlayerState.FREE;
enum PlayerState {
FREE,
FREEZE
}