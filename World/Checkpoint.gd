extends Area2D

onready var animatedSprite: = $AnimatedSprite

var active = true

func _on_Checkpoint_body_entered(body):
	if not body is Player: return
	if not active: return
	animatedSprite.play("Checked")
	active = false
	Events.emit_signal("hit_checkpoint", position)
