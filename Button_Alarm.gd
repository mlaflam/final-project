extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is Button:
			child.visible = false

func _on_pressed():
	RoomManager.sad = false
	for child in get_children():
			if child is Button:
				child.visible = true
