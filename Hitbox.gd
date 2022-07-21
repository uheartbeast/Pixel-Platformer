extends Area2D

func _on_Hitbox_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
