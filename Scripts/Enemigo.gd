extends KinematicBody2D

#Determina la velocidad del enemigo
var velocidad = -500;
func _process(delta):
	move_and_slide(Vector2(velocidad,0))
	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Jugador"):
		body.queue_free();
		get_node("/root/Level1").vivo = false;
	if body.is_in_group("Screen"):
		queue_free();
