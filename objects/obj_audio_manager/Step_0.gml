// Controle da música global
if (global.music_on) {

    // Se não estiver tocando, iniciar novamente
    if (!audio_is_playing(global.current_music)) {
        global.current_music = audio_play_sound(musicaJogo, 1, true);
    }

    // Aplicar volume
    audio_sound_gain(global.current_music, global.music_volume, 0);

} else {
    // Música OFF
    audio_stop_sound(global.current_music);
}

// Step Event do obj_audio_manager

// Ajusta o volume mestre do jogo em tempo real
audio_master_gain(global.vol_music);

// Se você tiver grupos de áudio separados para SFX, usaria audio_group_set_gain