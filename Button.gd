extends Button



func _on_pressed(): # make mirror panel visible dont want it to go back and forth 
	RoomManager.isMirrorOn = true
	RoomManager.wasPressed = true
