extends Area2D


func _on_Spikes_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
