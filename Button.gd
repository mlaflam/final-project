extends Button



func _on_pressed(): # make mirror panel visible dont want it to go back and forth 
	RoomManager.isMirrorOn = true
	RoomManager.sad = false # make him sad
	DialogueManager.show_dialogue_balloon(load("res://mirror.dialogue"), "mirror")
