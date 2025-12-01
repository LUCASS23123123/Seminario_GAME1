/// Evento Create do obj_audio_manager

// --- Inicializa as variáveis de som ---
// O comando !variable_global_exists garante que a gente não
// reinicie o volume se mudar de sala (caso o objeto seja persistente)

if (!variable_global_exists("vol_music")) {
    global.vol_music = 1; // Volume da música (0 a 1)
}

if (!variable_global_exists("vol_sfx")) {
    global.vol_sfx = 1;   // Volume dos efeitos (0 a 1)
}

if (!variable_global_exists("fullscreen")) {
    global.fullscreen = window_get_fullscreen();
}

// Inicia a música de fundo (exemplo)
// if (!audio_is_playing(snd_music_bg)) {
//     audio_play_sound(snd_music_bg, 100, true);
// }





// Garantir variáveis globais
if (!variable_global_exists("music_on")) global.music_on = true;
if (!variable_global_exists("sfx_on")) global.sfx_on = true;
if (!variable_global_exists("music_volume")) global.music_volume = 1; // 0 a 1
if (!variable_global_exists("sfx_volume")) global.sfx_volume = 1;

// Parar qualquer som que esteja tocando
audio_stop_all();

// Iniciar música somente uma vez
if (global.music_on) {
    global.current_music = audio_play_sound(musicaJogo, 1, true);
    audio_sound_gain(global.current_music, global.music_volume, 0);
} else {
    global.current_music = -1;
}
