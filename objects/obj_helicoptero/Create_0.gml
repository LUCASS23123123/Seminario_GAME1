//create do helicoptero
// Distância em pixels que o player precisa chegar para tocar o som
sound_range = 400;

// Controla se o som já tocou
sound_played = false;
sound_id = -1; // ID do som tocando
sound_range = 600; // distancia do som

/// Evento Create do obj_helicoptero

// Variável para controlar quanto tempo a mensagem fica na tela
// Começa com 0 (mensagem desligada)
aviso_timer = 0;