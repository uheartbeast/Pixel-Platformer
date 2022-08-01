tool
extends Path2D

enum ANIMATION_TYPE {
	LOOP,
	BOUNCE
}

export(ANIMATION_TYPE) var animation_type setget set_animation_type
export(int) var speed = 1 setget set_speed

onready var animationPlayer := $AnimationPlayer as AnimationPlayer

func set_animation_type(value):
	animation_type = value
	_update_animation()

func set_speed(value):
	speed = value
	_update_animation()

func _ready():
	_update_animation()

func _update_animation():
	if not animationPlayer:
		return

	animationPlayer.playback_speed = speed

	match animation_type:
		ANIMATION_TYPE.LOOP: animationPlayer.play("MoveAlongPathLoop")
		ANIMATION_TYPE.BOUNCE: animationPlayer.play("MoveAlongPathBounce")
