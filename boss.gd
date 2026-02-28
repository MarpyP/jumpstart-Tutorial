extends RigidBody2D

@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#look_at(player.global_position)
	linear_velocity += (player.global_position - global_position).normalized() * delta * 1000
	#linear_velocity += (player.global_position - global_position) * delta * 10
	linear_velocity *= 0.99
	$Node2D.look_at(player.global_position)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
		
