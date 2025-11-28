draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

// Título
draw_text(room_width * 0.5, 80, "CRÉDITOS");

// Créditos (linhas fixas)
draw_text(room_width * 0.5, 160, "Lucas Campos — Programação");
draw_text(room_width * 0.5, 200, "Lucas Campos — Arte");
draw_text(room_width * 0.5, 240, "Lucas Campos — Design do Jogo");
draw_text(room_width * 0.5, 280, "Recursos usados:");
draw_text(room_width * 0.5, 320, "GameMaker Studio 2 — Engine");
draw_text(room_width * 0.5, 360, "Bibliotecas externas com licença livre");

// Botão Voltar
draw_text(room_width * 0.5, room_height - 80, "[ VOLTAR ]");
