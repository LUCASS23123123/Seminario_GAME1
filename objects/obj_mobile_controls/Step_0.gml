// resetar a cada frame
global.touch_right = false;
global.touch_left = false;
global.touch_jump = false;
global.touch_shoot = false;

var t = device_mouse_check_button(0, mb_left);
var tx = device_mouse_x(0);
var ty = device_mouse_y(0);

// Direita
if (tx > 800 && ty > 900) {
    global.touch_right = true;
}

// Esquerda
if (tx > 700 && tx < 780 && ty > 900) {
    global.touch_left = true;
}

// Pulo
if (tx > 100 && tx < 200 && ty > 900 && t) {
    global.touch_jump = true;
}

// Atirar
if (tx > 1200 && tx < 1300 && ty > 900 && t) {
    global.touch_shoot = true;
}
/// Step

// reset
global.touch_left  = 0;
global.touch_right = 0;
global.touch_jump  = 0;
global.touch_shoot = 0;

// apenas mobile
if (!(os_type == os_android || os_type == os_ios)) exit;

// posição do toque
var mx = device_mouse_x(0);
var my = device_mouse_y(0);

var pressed      = device_mouse_check_button(0, mb_left);
var just_pressed = device_mouse_check_button_pressed(0, mb_left);

// ESQUERDA
if (point_in_rectangle(mx, my, btn_left[0], btn_left[1], btn_left[2], btn_left[3])) {
    if (pressed) global.touch_left = 1;
}

// DIREITA
if (point_in_rectangle(mx, my, btn_right[0], btn_right[1], btn_right[2], btn_right[3])) {
    if (pressed) global.touch_right = 1;
}

// PULO
if (point_in_rectangle(mx, my, btn_jump[0], btn_jump[1], btn_jump[2], btn_jump[3])) {
    if (just_pressed) global.touch_jump = 1;
}

// ATIRAR
if (point_in_rectangle(mx, my, btn_shoot[0], btn_shoot[1], btn_shoot[2], btn_shoot[3])) {
    if (just_pressed) global.touch_shoot = 1;
}
var mx = device_mouse_x(0);
var my = device_mouse_y(0);
var pressed = device_mouse_check_button(0, mb_left);
var just_pressed = device_mouse_check_button_pressed(0, mb_left);

// ESQUERDA
if (point_in_rectangle(mx, my, btn_left.x1, btn_left.y1, btn_left.x2, btn_left.y2)) {
    if (pressed) global.key_left = 1;
}

// DIREITA
if (point_in_rectangle(mx, my, btn_right.x1, btn_right.y1, btn_right.x2, btn_right.y2)) {
    if (pressed) global.key_right = 1;
}

// PULAR
if (point_in_rectangle(mx, my, btn_jump.x1, btn_jump.y1, btn_jump.x2, btn_jump.y2)) {
    if (just_pressed) global.key_jump = 1;
}

// ATIRAR
if (point_in_rectangle(mx, my, btn_shoot.x1, btn_shoot.y1, btn_shoot.x2, btn_shoot.y2)) {
    if (just_pressed) global.key_shoot = 1;
}
