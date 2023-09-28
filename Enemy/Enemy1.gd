extends CharacterBody2D

var health = 5
var Bullet = load("res://Enemy/enemy_bullet.tscn")

func _ready():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(100,200),2.0)
	tween.tween_property(self, "position", Vector2(900,200),3.0)
	tween.tween_property(self, "position", Vector2(900,500),3.0)
	tween.tween_property(self, "position", Vector2(-100,500),3.0)
	tween.tween_callback(die)
	
	
	
	
func die():
	queue_free()

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(10)
		queue_free()


func _on_timer_timeout():
	var Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var bullet = Bullet.instantiate()
		bullet.position = position + Vector2(0, 40)
		bullet.rotation = PI
		Effects.add_child(bullet)
