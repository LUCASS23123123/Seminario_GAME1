draw_clear(c_black);
draw_set_halign(fa_center);

// --------------------------------------
// DESENHAR O SPRITE DO LOGO
// --------------------------------------
draw_sprite(spr_logo, 0, room_width/-80, 80);

// Logo de texto (mantido)
draw_text(room_width/2, 100, "ZUMBLS");

// -------------------------------
// BOTÕES
// -------------------------------
var btn_texts = ["Inicio", "Configuracoes", "Creditos", "Sair"];

btn_x = room_width / 2;
btn_y_start = 250;
btn_spacing = 70;
btn_width = 200;
btn_height = 40;

for (var i = 0; i < 4; i++) {

    var bx = btn_x - btn_width/2;
    var by = btn_y_start + i * btn_spacing;

    draw_set_color(c_gray);
    draw_rectangle(bx, by, bx + btn_width, by + btn_height, false);

    draw_set_color(c_white);
    draw_text(btn_x, by + btn_height/2 - 8, btn_texts[i]);
}

// -------------------------------
// CLICK DOS BOTÕES
// -------------------------------
if (mouse_check_button_pressed(mb_left)) {

    var mx = mouse_x;
    var my = mouse_y;

    for (var i = 0; i < 4; i++) {

        var bx = btn_x - btn_width/2;
        var by = btn_y_start + i * btn_spacing;

        if (mx > bx && mx < bx + btn_width && my > by && my < by + btn_height) {

            switch (i) {
                case 0: room_goto(Room1); break;
                case 1: room_goto(rm_settings); break;
                case 2: room_goto(rm_credits); break;
                case 3: game_end(); break;
            }
        }
    }
}
