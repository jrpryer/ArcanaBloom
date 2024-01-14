extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var can_interact = true

var interact: Callable = func():
	pass


func _on_body_entered(_body):
	if can_interact:
		InteractionManager.register_area(self)


func _on_body_exited(_body):
#if can_interact:
	InteractionManager.unregister_area(self)
