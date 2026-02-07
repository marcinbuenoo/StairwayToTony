extends CharacterBody2D

@export var speed = 600

func  _physics_process(_delta):
	var direction = Input.get_vector("move_left","move_right", 
"move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		$Node2D/AnimatedSprite2D.play("walk")
		
		if direction.x != 0:
			$Node2D/AnimatedSprite2D.flip_h = direction.x < 0
	else:
		$Node2D/AnimatedSprite2D.play("stop")
		
	var turnDown = Input.is_action_pressed("turn_down")

	if turnDown:
		$Node2D/AnimatedSprite2D.play("shift")
