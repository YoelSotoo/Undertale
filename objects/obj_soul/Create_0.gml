flash_timer = 0;
// Definir bordes del cuadro de batalla (si no existen las variables globales)
if (!variable_global_exists("LeftEdge")) {
    global.LeftEdge = 400;
    global.RightEdge = 880;
    global.TopEdge = 200;
    global.BottomEdge = 520;
}