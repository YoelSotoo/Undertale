function scr_music_play(_music) {

    if (global.music_target == _music) return; // ya está destinada a sonar

    global.music_target = _music;
}
