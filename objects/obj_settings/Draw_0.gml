draw_clear(c_black);
draw_set_halign(fa_center);
draw_set_color(c_white);

// Título
draw_text(room_width/2, 100, "CONFIGURACOES");

// Labels
var settings = [
    "Música: " + (global.music_on ? "ON" : "OFF"),
    "Efeitos Sonoros: " + (global.sfx_on ? "ON" : "OFF"),
    "Volume: " + string(round(global.music_volume * 100)) + "%",
    "Voltar"
];

var btn_y_list = [btn_y_music, btn_y_sfx, btn_y_vol, btn_y_back];

for (var i = 0; i < 4; i++) {
    var bx = btn_x - btn_width / 2;
    var by = btn_y_list[i];

    draw_set_color(c_gray);
    draw_rectangle(bx, by, bx + btn_width, by + btn_height, false);

    draw_set_color(c_white);
    draw_text(btn_x, by + btn_height / 2 - 8, settings[i]);
}
