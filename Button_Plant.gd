extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	RoomManager.isPlantOn = true
	RoomManager.sad = true # make him sad
	DialogueManager.show_dialogue_balloon(load("res://plant.dialogue"), "plant")
