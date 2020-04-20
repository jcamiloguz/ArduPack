extends Area2D

var bala = preload("res://Escena/bala.tscn");
var disparo = true;
export var velocidad = 1000;
export var ratio = 0.4;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	if rotation_degrees > -40:
		if Input.is_action_pressed("ui_left"):
			rotation_degrees += -5
	if rotation_degrees < 45:
		if Input.is_action_pressed("ui_right"):
			rotation_degrees += 5
	if(disparo):
		var bala_creada = bala.instance();
		bala_creada.position = get_global_position();
		bala_creada.rotation_degrees = rotation_degrees;
		bala_creada.apply_impulse(Vector2(),Vector2(velocidad,0).rotated(rotation))
		get_tree().get_root().add_child(bala_creada);
		disparo = false;
		yield(get_tree().create_timer(ratio),"timeout")
		disparo = true;
