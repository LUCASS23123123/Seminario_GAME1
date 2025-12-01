// Evento: Colisão com obj_player

// 1. Verifica se o player precisa de cura
if (global.life < 8) {

    // --- NOVO: Toca o som de cura ---
    // Prioridade 10 (alta) para garantir que o jogador escute
    audio_play_sound(snd_bandagem, 10, false); 

    // 2. Aumenta a vida
    global.life += 1;

    // 3. Trava de Segurança
    if (global.life > 8) {
        global.life = 8;
    }

    // 4. Destrói a bandagem
    instance_destroy();
}