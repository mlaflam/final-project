extends Button

var button_name: String  # Store the name of the button

# Called when the node enters the scene tree for the first time.
func _ready():
	button_name = name  # Store the name of the button

func _on_pressed():
	RoomManager.target_button_name = button_name  # Setting target button name
	DialogueManager.show_dialogue_balloon(load("res://alarm.dialogue"), "alarm")
