extends Spatial


func _ready():
	$Panel.hide()
	reset_positions()

	
func reset_positions():
	$Player1.translation = $Player1SpawnPoint.translation 
	$Player1.rotation_degrees = $Player1SpawnPoint.rotation_degrees 
	$Player2.translation = $Player2SpawnPoint.translation 
	$Player2.rotation_degrees = $Player2SpawnPoint.rotation_degrees
	$Ball.translation = $BallSpawnPoint.translation
	pass


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

func _on_Player1GoalArea_body_entered(body):
	if body is RigidBody:
		print("Player 2 Score")	
		reset_positions()
	# replace with function body


func _on_Player2GoalArea_body_entered(body):
	if body is RigidBody:
		print("Player 1 Score")	
		reset_positions()