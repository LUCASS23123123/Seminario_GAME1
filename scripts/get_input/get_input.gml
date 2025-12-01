/// get_input()

// Reset
key_left  = 0;
key_right = 0;
key_jump  = 0;
key_shoot = 0;

// Tamanho real da GUI
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Mouse/toque convertido para a GUI
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var pressed       = device_mouse_check_button(0, mb_left);
var just_pressed  = device_mouse_check_button_pressed(0, mb_left);


// ==============================
// HITBOXES MOBILE
// ==============================

// ESQUERDA
if (point_in_rectangle(mx, my, 60, gui_h - 180, 180, gui_h - 60)) {
    if (pressed) key_left = 1;
}

// DIREITA
if (point_in_rectangle(mx, my, 200, gui_h - 180, 320, gui_h - 60)) {
    if (pressed) key_right = 1;
}

// PULAR
if (point_in_rectangle(mx, my, gui_w - 320, gui_h - 180, gui_w - 200, gui_h - 60)) {
    if (just_pressed) key_jump = 1;
}

// ATIRAR
if (point_in_rectangle(mx, my, gui_w - 180, gui_h - 180, gui_w - 60, gui_h - 60)) {
    if (just_pressed) key_shoot = 1;
}
