#class_name Player 
extends CharacterBody2D
@export var movement_speed : float
var force_coefficient = 20
var apply_gravity : bool
var gravity = ProjectSettings.get("physics/2d/default_gravity")
var sprite: Sprite2D 
var sprite2: Sprite2D 

func _process(delta):
	sprite = get_node("Sad")
	sprite2 = get_node("Happy")
	if RoomManager.sad == true: #display sad
		sprite.visible = true
		sprite2.visible = false
	
	else:
		sprite.visible = false
		sprite2.visible = true
		

# Called when the node enters the scene tree for the first time.
func _ready():
	if self.motion_mode == 0: # Motion Mode 0 is for "grounded", which is like a platformer
		apply_gravity = true
	else: 
		apply_gravity = false # Motion Mode 1 is for "floating", which is for top-down games
	pass # Replace with function body.

func get_input(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Check if input direction is less than 0 in the x-axis (moving left)
	if input_direction.x < 0:
		for child in get_children():
			if child is Sprite2D:
				child.flip_h = true
				
	else:
		for child in get_children():
			if child is Sprite2D:
				child.flip_h = false

	if apply_gravity:
		velocity.x = input_direction.x * movement_speed
		velocity.y += gravity * delta
	else:
		velocity = input_direction * movement_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_input(delta)

	var pre_collision_velocity
	pre_collision_velocity = velocity # velocity goes to 0,0 when we collide, which is why we record the velocity prior to the move_and_slide() func call
	move_and_slide()

	for i in get_slide_collision_count():
		var collision : KinematicCollision2D = get_slide_collision(i)

		if collision.get_collider().get_class() == "RigidBody2D":
			var collision_normal = collision.get_normal()
			if collision_normal.x < 0 and pre_collision_velocity.x > 0:
				collision_normal.x = -collision_normal.x
			if collision_normal.y < 0 and pre_collision_velocity.y > 0:
				collision_normal.y = -collision_normal.y
			collision.get_collider().apply_force(pre_collision_velocity * collision_normal * force_coefficient)

		

