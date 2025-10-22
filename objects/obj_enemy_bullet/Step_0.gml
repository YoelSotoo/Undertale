// Movimiento básico
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Si sale del área, destrúyelo
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
