extends CharacterBody2D

@export var speed = 50.0
var motion = Vector2.ZERO

# Touch joystick state
var touch_index = -1
var touch_start = Vector2.ZERO
var touch_current = Vector2.ZERO
var joystick_radius = 50.0

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and touch_index == -1:
			touch_index = event.index
			touch_start = event.position
			touch_current = event.position
		elif not event.pressed and event.index == touch_index:
			touch_index = -1
			touch_start = Vector2.ZERO
			touch_current = Vector2.ZERO
	elif event is InputEventScreenDrag:
		if event.index == touch_index:
			touch_current = event.position

func _physics_process(delta: float) -> void:
	var touch_vector = touch_current - touch_start
	var using_touch = touch_index != -1 and touch_vector.length() > 10.0

	if using_touch:
		touch_vector = touch_vector.limit_length(joystick_radius)
		if abs(touch_vector.x) > abs(touch_vector.y):
			# horizontal
			$AnimatedSprite2D.play("Side")
			$AnimatedSprite2D.flip_h = touch_vector.x > 0
			motion.x = speed * sign(touch_vector.x)
			motion.y = 0
		else:
			# vertical
			if touch_vector.y > 0:
				$AnimatedSprite2D.play("Down")
			else:
				$AnimatedSprite2D.play("Up")
			motion.y = speed * sign(touch_vector.y)
			motion.x = 0
	elif Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("Side")
		$AnimatedSprite2D.flip_h = true
		motion.x = speed
		motion.y = 0
	elif Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("Side")
		$AnimatedSprite2D.flip_h = false
		motion.x = -speed
		motion.y = 0
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("Down")
		motion.y = speed
		motion.x = 0
	elif Input.is_action_pressed("up"):
		$AnimatedSprite2D.play("Up")
		motion.y = -speed
		motion.x = 0
	else:
		$AnimatedSprite2D.play("Idle")
		motion.x = 0
		motion.y = 0

	velocity = motion
	move_and_slide()
