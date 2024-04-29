extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://bedroom.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	#quitting out of window
	get_tree().quit()
