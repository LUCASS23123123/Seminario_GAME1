// =========================================================
// 0. BACKGROUND (Esticado na Câmera)
// =========================================================

// 1. Pega onde a câmera está e qual o tamanho dela
var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);
var _cw = camera_get_view_width(view_camera[0]);
var _ch = camera_get_view_height(view_camera[0]);

// 2. Define qual sprite usar (USE O NOME REAL DO SEU SPRITE AQUI)
var _bg_sprite = spr_logo; // <--- Substitua se o nome for diferente

// 3. Desenha o sprite esticado preenchendo a visão da câmera
if (sprite_exists(_bg_sprite)) {
    // Se você fez o Passo 1 (Origem Top Left), isso vai ficar perfeito.
    draw_sprite_stretched(_bg_sprite, 0, _cx, _cy, _cw, _ch);
} else {
    draw_clear(c_black); // Segurança caso o sprite não exista
}




// =========================================================
// 2. CONFIGURAÇÃO DO MENU (Empurrado para a Direita)
// =========================================================
var btn_texts = ["INICIO", "CONFIGURACOES", "CREDITOS", "SAIR"];
var total_botoes = array_length(btn_texts);

// --- AJUSTE DE POSIÇÃO ---
var menu_x = room_width * 0.85; 
var menu_y_start = room_height * 0.45; // Baixei um pouquinho
var spacing = 70; 


// Configura fonte e alinhamento
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


// =========================================================
// 3. LOOP DOS BOTÕES
// =========================================================
for (var i = 0; i < total_botoes; i++) {

    var _yy = menu_y_start + (i * spacing);
    
    // Variáveis visuais padrão
    var _cor = c_ltgray; 
    var _escala = 1.0;   
    var _texto = btn_texts[i];
    var _sombra_dist = 2; // Distância da sombra
    
    // --- DETECÇÃO DO MOUSE ---
    // Aumentei a área de detecção para ficar mais fácil clicar
    if (point_in_rectangle(mouse_x, mouse_y, menu_x - 130, _yy - 30, menu_x + 130, _yy + 30)) {
        
        // MOUSE ESTÁ EM CIMA:
        _cor = c_yellow;  
        _escala = 1.2;    
        _texto = "> " + _texto + " <"; 
        _sombra_dist = 4; // Sombra fica mais longe quando seleciona (efeito 3D leve)
        
        // --- CLIQUE ---
        if (mouse_check_button_pressed(mb_left)) {
            switch (i) {
                case 0: room_goto(Room1); break;       // Inicio
                case 1: room_goto(rm_settings); break; // Config
                case 2: room_goto(rm_credits); break;  // Creditos
                case 3: game_end(); break;             // Sair
            }
        }
    }
    
    // --- DESENHO FINAL ---
    
    // 1. Dica Pro: Desenhar um "fundo escuro" semitransparente atrás do texto
    // Isso ajuda a ler se o fundo for muito colorido (como o zumbi)
    draw_set_color(c_black);
    draw_set_alpha(0.5); // 50% transparente
    // Desenha um retângulo suave atrás do texto
    draw_roundrect(menu_x - 100, _yy - 20, menu_x + 100, _yy + 20, false);
    draw_set_alpha(1); // Volta a opacidade normal
    
    // 2. Sombra do texto
    draw_set_color(c_black);
    draw_text_transformed(menu_x + _sombra_dist, _yy + _sombra_dist, _texto, _escala, _escala, 0);
    
    // 3. Texto principal
    draw_set_color(_cor);
    draw_text_transformed(menu_x, _yy, _texto, _escala, _escala, 0);
}

// Reseta tudo
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);