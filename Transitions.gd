extends CanvasLayer

onready var animationPlayer = $AnimationPlayer

signal transition_completed

func play_exit_transition():
	animationPlayer.play("ExitLevel")

func play_enter_transition():
	animationPlayer.play("EnterLevel")

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("transition_completed")
