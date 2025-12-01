/// Evento Draw GUI

// --- TRAVA DE SEGURANÇA (Evita erros de variável) ---
if (!variable_global_exists("life")) global.life = 8;
if (!variable_global_exists("bullets")) global.bullets = 12;
if (!variable_global_exists("bullets_max")) global.bullets_max = 30;


// =========================================================
// 1. BARRA DE VIDA (Canto Superior Esquerdo)
// =========================================================
draw_sprite(spr_life, max(0, global.life), 20, 20);


// =========================================================
// 2. MUNIÇÃO (Abaixo da Vida)
// =========================================================
// Ícone da bala
draw_sprite(spr_icone_bullet, 0, 20, 60);

// Texto da bala
draw_set_color(c_yellow);
// Desenhado no X=70 para não ficar em cima do ícone
draw_text(70, 60, string(global.bullets) + " / " + string(global.bullets_max));
draw_set_color(c_white);


// =========================================================
// 3. CONTADOR DE RESGATES (Canto Superior Direito)
// =========================================================
draw_set_color(c_lime); // Verde para destacar
draw_set_halign(fa_right); // Alinha o texto pela direita

// Pega a largura da tela para colar no canto direito
var _largura_tela = display_get_gui_width();

// Desenha: "Resgates: 0 / 1"
draw_text(_largura_tela - 20, 20, "Resgates: " + string(global.resgatados) + " / " + string(global.total_necessario));

// Resetar alinhamento e cor (Muito importante!)
draw_set_halign(fa_left);
draw_set_color(c_white);


/// DRAW GUI

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();


/// DRAW GUI

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// BOTÃO ESQUERDA
draw_sprite(Spr_direction_left, 0, 120, gui_h - 120);

// BOTÃO DIREITA
draw_sprite(Spr_direction_right, 0, 260, gui_h - 120);

// BOTÃO PULAR
draw_sprite(Spr_dpad_element_south, 0, gui_w - 260, gui_h - 120);

// BOTÃO ATIRAR
draw_sprite(Spr_button_atirar, 0, gui_w - 120, gui_h - 120);
