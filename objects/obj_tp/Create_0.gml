// Room de destino
target_rm = room;    // Por defecto se queda en la misma room
target_x = 0;        // X destino (solo para TP normal)
target_y = 0;        // Y destino (solo para TP normal)

// Tipo de TP
maintain_pos = false; // true = mantener posición del player (para tiendas), false = mover player

// Bloquear movimiento del player al entrar (opcional)
block_player = false; 

// Guardar la room actual para regresar
global.room_before_tp = room;

// Evitar que el TP se active varias veces
active = true;
