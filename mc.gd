extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var water_level = 0

func _physics_process(delta: float) -> void:
	if water_level == 0:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		if not is_on_floor():
			velocity += get_gravity() * delta
		var direction := Input.get_axis("left", "right")
		var direction_2 := Input.get_axis("up", "down")
		velocity.x += direction * SPEED * delta * 5
		velocity.y += direction_2 * SPEED * delta * 10
		velocity *= 0.95
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	water_level += 1


func _on_area_2d_body_exited(body: Node2D) -> void:
	water_level -= 1
