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
