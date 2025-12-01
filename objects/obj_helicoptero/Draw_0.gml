/// Evento Draw do obj_helicoptero

// 1. Desenha o próprio helicóptero (Obrigatório!)
draw_self();

// 2. Verifica se o timer está ativo
if (aviso_timer > 0) {
    
    // Configura o texto (Centralizado e Vermelho)
    draw_set_halign(fa_center); // Alinha o texto pelo centro
    draw_set_color(c_red);
    
    // Desenha o texto ACIMA do helicóptero
    // 'x' é o centro do helicóptero
    // 'y - 80' é 80 pixels acima dele
    draw_text(x, y - 80, "RESGATE TODOS OS SOBREVIVENTES!");
    
    // Reseta as cores e alinhamento (Para não estragar outros desenhos)
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    
    // Diminui o timer (contagem regressiva)
    aviso_timer -= 1;
}