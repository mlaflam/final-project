extends TextureRect

var spawn_position = Vector2(1425, 700)


func _ready():
	RoomManager.wasBath = false
	var player = preload("res://Player.tscn").instantiate()
	player.position = spawn_position # Set the player's position to the spawn position
	add_child(player)
	
