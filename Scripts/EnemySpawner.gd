extends Node


var enemy = preload("res://Escena/Enemigo.tscn");
var aparicion = 0.8;
export var aparecer = true;


func _process(delta):
	if(aparecer):
		spawn()
		aparecer = false;
		yield(get_tree().create_timer(aparicion),"timeout")
		aparecer = true;
	
func spawn():
	var enemigo = enemy.instance();
	var pos = Vector2();
	pos.x = 1632;
	pos.y = rand_range(32,592);
	enemigo.set_position(pos);
	get_node("container").add_child(enemigo)
	
	
