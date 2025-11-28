// Pausar el juego
global.game_paused = true;
// Crear la pantalla de game over (arriba de todo)
instance_create_layer(0, 0, "GameOver", obj_gameover_carro);
instance_destroy(obj_spawner);

