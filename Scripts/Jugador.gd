extends KinematicBody2D

var motion = Vector2()

func _ready():
	print(self.get_path());
func _physics_process(delta):
	
	if(position.y <= 50):
		motion.y = 150
	if(position.y >= 570):
		motion.y = -150
	
	else:
		if (Input.is_action_pressed("ui_up")):
			motion.y += -20
		else:
			if (Input.is_action_pressed("ui_down")):
				motion.y+=20
		
	
	motion= move_and_slide(motion)
	
