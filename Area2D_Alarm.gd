extends Area2D

var sprite: Sprite2D  # Reference to the target Sprite2D node
var time: int 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.visible = false 
	
	for child in get_children():
			if child is Sprite2D:
				child.visible = false
				
	if RoomManager.target_sprite:
		sprite = get_node(RoomManager.target_sprite)
		sprite.visible = true # make target sprite visible 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if RoomManager.target_button_name: #if a target button exists 
		match RoomManager.target_button_name:
			"Button1":
				RoomManager.target_sprite = "6-clock"
				RoomManager.correctTime = false
				time = 3
			"Button2":
				RoomManager.target_sprite = "630-clock"
				RoomManager.correctTime = true
				time = 6
			"Button3":
				RoomManager.target_sprite = "7-clock"
				RoomManager.correctTime = false
				time = 9
		
		#print(RoomManager.target_sprite)
		sprite = get_node(RoomManager.target_sprite)
		$Button.visible = false 
		await get_tree().create_timer(time).timeout
		sprite.visible = true # make target sprite visible 
		
	
	else:
		for child in get_children():
			if child is Sprite2D:
				child.visible = false
		# if it doesnt exist yet make all invisible?
		

func _on_body_entered(body): #make button visible
	$Button.visible = true 


func _on_body_exited(body): #make button invisible
	$Button.visible = false 
