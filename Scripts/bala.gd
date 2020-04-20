extends RigidBody2D


#

func _on_Bala_body_entered(body):
	if body.is_in_group("Enemigo"):
		body.queue_free();
		queue_free();
		get_node("/root/Level1").puntaje += 5;
	if body.is_in_group("Screen"):
			queue_free();




	
