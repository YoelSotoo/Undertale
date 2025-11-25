// Si hay música objetivo diferente a la actual:
if (global.music_target != global.current_music) {

    // 1) Fade out de la música actual
    if (global.current_music != noone) {
        var vol = audio_sound_get_gain(global.current_music);
        vol -= global.music_fade_speed;

        if (vol <= 0) {
            audio_stop_sound(global.current_music);
            global.current_music = noone;
        } else {
            audio_sound_gain(global.current_music, vol, 0);
        }
    }

    // 2) Si ya no hay música sonando, reproducir la nueva
    if (global.current_music == noone) {
        audio_play_sound(global.music_target, 1, true);
        audio_sound_gain(global.music_target, 0, 0); // iniciar en volumen 0

        global.current_music = global.music_target;
    }
}

// 3) Fade-in de la música objetivo
if (global.current_music == global.music_target) {
    var vol2 = audio_sound_get_gain(global.current_music);

    if (vol2 < global.music_volume) {
        vol2 += global.music_fade_speed;
        audio_sound_gain(global.current_music, clamp(vol2, 0, global.music_volume), 0);
    }
}
