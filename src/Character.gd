extends CharacterBody2D

const max_speed = 300
const accel = 3000
const friction = 3200

var input = Vector2.ZERO

func _physics_process(delta):
	if DialogManager.is_dialog_active || UiManager.menu_active:
		return
	player_movement(delta)

func get_input():
#	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
#	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
#	return input.normalized()
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = (Input.get_action_strength("down") - Input.get_action_strength("up"))/2
	return input.normalized()
	
		
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta) 
		else:
			velocity = Vector2.ZERO
		
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	
	move_and_slide()
