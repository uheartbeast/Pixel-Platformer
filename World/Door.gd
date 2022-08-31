extends Area2D

export(String, FILE, "*.tscn") var target_level_path = ""

var player = false

func go_to_next_room():
	Transitions.play_exit_transition()
	get_tree().paused = true
	yield(Transitions, "transition_completed")
	Transitions.play_enter_transition()
	get_tree().paused = false
	get_tree().change_scene(target_level_path)

func _process(delta):
	if not player: return
	if not player.is_on_floor(): return
	if Input.is_action_just_pressed("ui_up"):
		if target_level_path.empty(): return
		go_to_next_room()

func _on_Door_body_entered(body):
	if not body is Player: return
	body.on_door = true
	player = body

func _on_Door_body_exited(body):
	if not body is Player: return
	body.on_door = false
	player = null
	
