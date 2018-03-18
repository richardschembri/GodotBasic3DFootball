extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Panel.hide()


func _process(delta):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area_body_entered( body ):
	if body is RigidBody:
		print("win")
		$Panel.show()