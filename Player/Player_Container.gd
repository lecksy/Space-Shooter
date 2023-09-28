extends Node2D


func _physics_process(_delta):
	if get_child_count() == 0 and Global.Player != null:
		var player = Global.Player.instantiate()
		player.position = Vector2(400,950)
		add_child(player)
