extends Area2D


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CanvasLayer/Label.text = str(round($Timer.time_left))



func _on_body_entered(body: Node2D) -> void:
	$Timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://win.tscn")
