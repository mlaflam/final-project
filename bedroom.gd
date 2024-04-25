extends TextureRect

var spawn_position = Vector2(200, 700)

@export var wasBath : bool

func _ready():
	var player = preload("res://Player.tscn").instantiate()
	add_child(player)
	
	if !RoomManager.wasBath:
		print("hello")
		player.position = spawn_position # Set the player's position to the spawn position
	
	if RoomManager.wasBath:
		print("goodbye")
		# Access the Position2D node representing the destination point
		var destination_point = $Destination
		
		# Set the player's position to the destination point
		player.position = destination_point.position
