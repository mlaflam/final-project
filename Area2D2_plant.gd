extends Area2D

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if RoomManager.isPlantOn == true:
		$Sprite2D.visible = true
		$Button.visible = false 
	
	else:
		$Sprite2D.visible = false 
		

func _ready():
	#dont want to show if mirror on
	#if RoomManager.wasPressed:
		$Button.visible = false 
	


func _on_body_entered(body): #make button visible
	$Button.visible = true 


func _on_body_exited(body): #make button invisible
	$Button.visible = false 
