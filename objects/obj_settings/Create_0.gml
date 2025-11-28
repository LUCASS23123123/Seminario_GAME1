btn_x = room_width / 2;
btn_y_music = 200;
btn_y_sfx = 250;
btn_y_vol = 300;
btn_y_back = 380;
btn_width = 200;
btn_height = 40;

// Garantir variáveis globais
if (!variable_global_exists("music_on")) global.music_on = true;
if (!variable_global_exists("sfx_on")) global.sfx_on = true;
if (!variable_global_exists("music_volume")) global.music_volume = 1;
if (!variable_global_exists("sfx_volume")) global.sfx_volume = 1;
