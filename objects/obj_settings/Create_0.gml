/// Evento Create

// --- 1. Inicializa Variáveis Globais (Se não existirem) ---
// Usamos 'global' para que o jogo todo saiba o volume
if (!variable_global_exists("vol_music"))  global.vol_music = 1; // 0 a 1
if (!variable_global_exists("vol_sfx"))    global.vol_sfx = 1;
if (!variable_global_exists("fullscreen")) global.fullscreen = window_get_fullscreen();

// --- 2. Variáveis de Controle do Menu ---
// Variável para saber qual slider estamos arrastando agora (-1 = nenhum)
dragging_slider = -1;