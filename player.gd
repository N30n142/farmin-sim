extends CharacterBody2D


@export var speed = 50.0
var motion = Vector2.ZERO

func _physics_process(delta: float) -> void:
	
	
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("Side")
		$AnimatedSprite2D.flip_h = true
		print("moving")
		motion.x = speed
		motion.y = 0 
	elif Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("Side")
		$AnimatedSprite2D.flip_h = false
		print("moving")
		motion.x = -speed
		motion.y = 0 
	elif Input.is_action_pressed("down"):
		print("moving")
		$AnimatedSprite2D.play("Down")
		motion.y = speed
		motion.x = 0
	elif Input.is_action_pressed("up"):
		print("moving")
		$AnimatedSprite2D.play("Up")
		motion.y = -speed
		motion.x = 0
	else:
		$AnimatedSprite2D.play("Idle")
		motion.x = 0
		motion.y = 0 
		
	velocity = motion
	move_and_slide()
