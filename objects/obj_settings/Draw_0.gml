// ========================================================
// 1. CONFIGURAÇÕES GERAIS E CORES
// ========================================================
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
var _click = mouse_check_button_pressed(mb_left);
var _hold  = mouse_check_button(mb_left);

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2;
var _cy = _gh / 2;

// Paleta de Cores "Industrial / Zumbi"
var c_ferrugem = make_color_rgb(180, 80, 20);      // Laranja queimado
var c_metal_escuro = make_color_rgb(50, 50, 50);   // Cinza chumbo
var c_metal_claro = make_color_rgb(120, 120, 120); // Cinza médio
var c_luz_verde = make_color_rgb(50, 200, 50);     // LED Ligado
var c_luz_vermelha = make_color_rgb(200, 50, 50);  // LED Desligado


// ========================================================
// 2. BACKGROUND (IMAGEM DE FUNDO)
// ========================================================
// Se o sprite existir, desenha ele esticado e levemente escurecido (c_dkgray)
if (sprite_exists(asset_get_index("spr_bg_settings"))) {
    draw_sprite_stretched_ext(spr_bg_settings, 0, 0, 0, _gw, _gh, c_dkgray, 1);
} else {
    // Se não tiver imagem, pinta de preto
    draw_clear(c_black);
}

// Dimmer (Retângulo preto transparente para destacar o painel)
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);


// ========================================================
// 3. O PAINEL DE METAL
// ========================================================
var _p_w = 350; // Largura do painel (metade)
var _p_h = 250; // Altura do painel (metade)

// Desenha a Borda (Ferrugem)
draw_set_color(c_ferrugem);
draw_roundrect(_cx - _p_w - 6, _cy - _p_h - 6, _cx + _p_w + 6, _cy + _p_h + 6, false);

// Desenha o Miolo (Metal Escuro)
draw_set_color(c_metal_escuro);
draw_roundrect(_cx - _p_w, _cy - _p_h, _cx + _p_w, _cy + _p_h, false);

// Detalhe: Parafusos nos cantos
draw_set_color(c_ltgray);
draw_circle(_cx - _p_w + 15, _cy - _p_h + 15, 5, false);
draw_circle(_cx + _p_w - 15, _cy - _p_h + 15, 5, false);
draw_circle(_cx - _p_w + 15, _cy + _p_h - 15, 5, false);
draw_circle(_cx + _p_w - 15, _cy + _p_h - 15, 5, false);

// Título
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_orange);
// Sombra do texto
draw_text_transformed(_cx + 2, _cy - 200 + 2, "CONFIGURACOES", 2, 2, 0);
// Texto principal
draw_text_transformed(_cx, _cy - 200, "CONFIGURACOES", 2, 2, 0);


// ========================================================
// 4. CONTROLES (SLIDERS E BOTÕES)
// ========================================================
var _start_y = _cy - 100;
var _spacing = 60;
var _bar_w = 300; // Largura da barra
var _bar_h = 16;  // Altura da barra

// --- A. MUSICA ---
var _yy = _start_y;
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(_cx - 160, _yy, "MUSICA"); 

// Definição da área da barra
var _bar_x1 = _cx - 140 + 20; 
var _bar_x2 = _bar_x1 + _bar_w;

// Lógica de Arraste (Música)
if ( (_hold && point_in_rectangle(_mx, _my, _bar_x1 - 20, _yy - 20, _bar_x2 + 20, _yy + 20)) || dragging_slider == 0) {
    if (_hold) {
        dragging_slider = 0;
        global.vol_music = clamp((_mx - _bar_x1) / _bar_w, 0, 1);
        // Atualiza o volume instantaneamente (se tiver gerenciador de audio)
        // audio_group_set_gain(audiogroup_music, global.vol_music, 0);
    } else {
        dragging_slider = -1;
    }
}

// Desenha Barra Música
draw_set_color(c_black); // Trilho
draw_roundrect(_bar_x1, _yy - _bar_h/2, _bar_x2, _yy + _bar_h/2, false);
draw_set_color(c_ferrugem); // Preenchimento
draw_roundrect(_bar_x1, _yy - _bar_h/2, _bar_x1 + (global.vol_music * _bar_w), _yy + _bar_h/2, false);
// Desenha Pino
var _knob_x = _bar_x1 + (global.vol_music * _bar_w);
draw_set_color(c_metal_claro);
draw_rectangle(_knob_x - 6, _yy - 12, _knob_x + 6, _yy + 12, false);


// --- B. EFEITOS (SFX) ---
_yy += _spacing; // Desce uma linha
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(_cx - 160, _yy, "EFEITOS"); 

// Lógica de Arraste (SFX)
if ( (_hold && point_in_rectangle(_mx, _my, _bar_x1 - 20, _yy - 20, _bar_x2 + 20, _yy + 20)) || dragging_slider == 1) {
    if (_hold) {
        dragging_slider = 1;
        global.vol_sfx = clamp((_mx - _bar_x1) / _bar_w, 0, 1);
        // Atualiza o volume instantaneamente
        // audio_group_set_gain(audiogroup_default, global.vol_sfx, 0);
    } else {
        dragging_slider = -1;
    }
}

// Desenha Barra SFX
draw_set_color(c_black);
draw_roundrect(_bar_x1, _yy - _bar_h/2, _bar_x2, _yy + _bar_h/2, false);
draw_set_color(c_ferrugem);
draw_roundrect(_bar_x1, _yy - _bar_h/2, _bar_x1 + (global.vol_sfx * _bar_w), _yy + _bar_h/2, false);
// Desenha Pino SFX
var _knob_x2 = _bar_x1 + (global.vol_sfx * _bar_w);
draw_set_color(c_metal_claro);
draw_rectangle(_knob_x2 - 6, _yy - 12, _knob_x2 + 6, _yy + 12, false);


// ========================================================
// 5. BOTÃO VOLTAR
// ========================================================
var _btn_y = _cy + 150;
var _btn_w = 200;
var _btn_h = 50;
var _bx1 = _cx - _btn_w/2;
var _bx2 = _cx + _btn_w/2;
var _by1 = _btn_y - _btn_h/2;
var _by2 = _btn_y + _btn_h/2;

var _hover = point_in_rectangle(_mx, _my, _bx1, _by1, _bx2, _by2);

// Cor do botão (Muda se passar o mouse)
if (_hover) draw_set_color(c_orange); else draw_set_color(c_ferrugem);

// Sombra do botão (para dar volume)
draw_roundrect(_bx1, _by1 + 5, _bx2, _by2 + 5, false);

// Corpo do botão
if (_hover) draw_set_color(make_color_rgb(220, 100, 40)); else draw_set_color(c_ferrugem);
draw_roundrect(_bx1, _by1, _bx2, _by2, false);

// Texto do botão
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(_cx, _btn_y, "VOLTAR", 1.2, 1.2, 0);

if (_click && _hover) {
    // --- AÇÃO DE VOLTAR ---
    if (room_exists(asset_get_index("rm_menu"))) {
        room_goto(rm_menu); 
    } else {
        show_debug_message("Botão Voltar Clicado (Verifique o nome da sala)");
    }
}

// Reseta alinhamento e cores (Boas práticas)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);