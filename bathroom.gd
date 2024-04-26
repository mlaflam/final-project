extends TextureRect

var spawn_position = Vector2(200, 700)

func _ready():
	RoomManager.wasBath = true
	var player = preload("res://Player.tscn").instantiate()
	add_child(player)
	player.position = spawn_position # Set the player's position to the spawn position


func _on_area_2d_mirror_body_entered(body):
	pass # Replace with function body.
