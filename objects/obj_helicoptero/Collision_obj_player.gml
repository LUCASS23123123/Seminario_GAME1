/// Evento Colisão: obj_helicoptero com obj_player

// Verifica se salvou todo mundo
if (global.resgatados >= global.total_necessario) {
    
    // --- SUCESSO ---
    if (room_exists(room_next(room))) {
        room_goto_next(); 
    } else {
        game_restart(); 
    }

} else {
    // --- FALTA GENTE (BLOQUEIO TOTAL) ---
    
    // 1. Ativa o Timer da mensagem
    aviso_timer = 120;
    
    // 2. Empurra o player para longe (FORTE)
    var _emprurrao = 20;
    
    // Se o player está à esquerda do helicóptero, joga ele pra esquerda
    if (other.x < x) {
        other.x -= _emprurrao;
    } else {
        other.x += _emprurrao;
    }
    
    // 3. Zera a velocidade do player para ele não "deslizar" pra dentro
    other.hspeed = 0;
    other.vspeed = 0;
}