draw_clear(c_black);
draw_set_halign(fa_center);

// Logo
draw_text(room_width/2, 100, "ZUMBLS");

// Botões
var btn_texts = ["Inicio", "Configuracoes", "Creditos", "Sair"];
for (var i = 0; i < 4; i++) {
    var bx = btn_x - btn_width/2;
    var by = btn_y_start + i * btn_spacing;
    draw_set_color(c_gray);
    draw_rectangle(bx, by, bx + btn_width, by + btn_height, false);
    draw_set_color(c_white);
    draw_text(btn_x, by + btn_height/2 - 8, btn_texts[i]);
}
