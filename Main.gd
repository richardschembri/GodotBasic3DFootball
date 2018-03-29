extends Spatial

onready var result_panel_label = get_node("ResultPanel/Label")
var player1_score = 0
onready var player1_scorelabel = get_node("ScoresPanel/Player1ScoreLabel")

var player2_score = 0
onready var player2_scorelabel = get_node("ScoresPanel/Player2ScoreLabel")

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
	if Input.is_key_pressed(KEY_N):
		set_player1_score(0)
		set_player2_score(0)
		reset_positions()
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		
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
		set_player2_score(player2_score + 1)

		
	# replace with function body

func set_player1_score(score):
		player1_score = score
		player1_scorelabel.text = "Player 1: %d" % player1_score	

func set_player2_score(score):
		player2_score = score
		player2_scorelabel.text = "Player 2: %d" % player2_score	

func _on_Player2GoalArea_body_entered(body):
	if $ResultPanel.visible:
		return
	if body is RigidBody:
		$ResultPanel.show()
		print("Player 1 Score")	
		result_panel_label.text = "Player 1 Score"
		set_player1_score(player1_score + 1)
