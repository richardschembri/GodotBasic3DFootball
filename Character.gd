extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var is_player1 = true
var speed = 600
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()

var camera
var anim_player

var character

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	camera = get_node("../Camera").get_global_transform()
	anim_player = get_node("AnimationPlayer")
	character = get_node(".")
	

func _physics_process(delta):
	direction = Vector3(0, 0, 0)
	var is_moving = false
	if is_player1:
		if Input.is_action_pressed("ui_left"):
			direction.x -= 1
			is_moving = true
		if Input.is_action_pressed("ui_right"):
			direction.x += 1	
			is_moving = true
		if Input.is_action_pressed("ui_up"):
			direction.z -= 1
			is_moving = true		
		if Input.is_action_pressed("ui_down"):
			direction.z += 1
			is_moving = true
	else:
		if Input.is_key_pressed(KEY_A):
			direction.x -= 1
			is_moving = true
		if Input.is_key_pressed(KEY_D):
			direction.x += 1	
			is_moving = true
		if Input.is_key_pressed(KEY_W):
			direction.z -= 1
			is_moving = true		
		if Input.is_key_pressed(KEY_S):
			direction.z += 1
			is_moving = true
						
	direction = direction.normalized()
	direction = direction * speed * delta
	
	if velocity.y > 0:
		gravity = -200
	else:
		gravity = -300
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
	if is_moving:
		var angle = atan2(direction.x, direction.z)
		var char_rot = character.get_rotation()

		char_rot.y = angle
		character.set_rotation(char_rot)
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 25
	
	#manually_handle_collision()
	
	var anim_to_play = "Idle-loop"
	
	if is_moving:
		anim_to_play = "Run"
		
	var current_anim = anim_player.get_current_animation()
	if current_anim != anim_to_play:
		anim_player.play(anim_to_play)
	
	# Cator for physics bug 
	
func manually_handle_collision():
	var hitcount = get_slide_count()	
	if hitcount > 0:
		var collision = get_slide_collision(0)
		if collision.collider is RigidBody:
			collision.collider.apply_impulse(collision.position, - collision.normal) #normal is the direction of the collision

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
