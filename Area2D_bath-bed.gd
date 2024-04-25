extends Area2D

# Expose spawn_position to the editor
@export var spawn_position : Vector2 = Vector2(200, 200)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		var next_scene = preload("res://bedroom.tscn")
		#set_global_position(spawn_position)
		#next_scene.spawn_position = spawn_position
		get_tree().change_scene_to_packed(next_scene)
	
