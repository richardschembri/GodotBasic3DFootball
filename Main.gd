extends Spatial

export (NodePath) var player1SpawnPointPath
onready var player1SpawnPointNode = get_node(player1SpawnPointPath)

export (NodePath) var player2SpawnPointPath
onready var player2SpawnPointNode = get_node(player2SpawnPointPath)

export (NodePath) var player1
export (NodePath) var player2

func _ready():
	$Panel.hide()
	
func respawn_Players():
#	player1SpawnPointNode.
	
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