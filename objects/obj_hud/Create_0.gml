
// --- 1. Inicializa Variáveis do Player ---
if (!variable_global_exists("life")) {
    global.life = 8;
}

if (!variable_global_exists("bullets")) {
    global.bullets = 12;
}

if (!variable_global_exists("bullets_max")) {
    global.bullets_max = 30;
}

// --- 2. Inicializa Sistema de Resgate ---
global.resgatados = 0; // Zera a contagem ao iniciar a fase

// Conta automaticamente quantos objetos 'obj_sobrevivente' existem na sala
global.total_necessario = instance_number(obj_sobrevivente);

// Tamanho da HUD (fixo e seguro)
display_set_gui_size(1280, 720);
