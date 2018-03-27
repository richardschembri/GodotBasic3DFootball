extends Spatial

onready var result_panel_label = get_node("ResultPanel/Label")

func _ready():
	#$ResultPanel.hide()
	reset_positions()

	
func reset_positions():
	$ResultPanel.hide()
	$Player1.translation = $Player1SpawnPoint.translation 
	$Player1.rotation_degrees = $Player1SpawnPoint.rotation_degrees 
	$Player2.translation = $Player2SpawnPoint.translation 
	$Player2.rotation_degrees = $Player2SpawnPoint.rotation_degrees

	$Ball.translation = $BallSpawnPoint.translation
	$Ball.linear_velocity = Vector3(0, 0, 0)
	$Ball.angular_velocity = Vector3(0, 0, 0)
	
	pass


func _process(delta):
	if Input.is_key_pressed(KEY_R):
		#get_tree().reload_current_scene()
		reset_positions()
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area_body_entered( body ):
	if body is RigidBody:
		print("win")
		$Panel.show()

func _on_Player1GoalArea_body_entered(body):
	if $ResultPanel.visible:
		return
	if body is RigidBody:
		$ResultPanel.show()
		print("Player 2 Score")	
		result_panel_label.text = "Player 2 Score"
	# replace with function body


func _on_Player2GoalArea_body_entered(body):
	if $ResultPanel.visible:
		return
	if body is RigidBody:
		$ResultPanel.show()
		print("Player 1 Score")	
		result_panel_label.text = "Player 1 Score"