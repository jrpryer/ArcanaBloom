extends Node2D

#var active_plots = []
var focus_plot: Plantable
var can_interact = true
var seedPlanted: String


#func register_plots(plot: Plantable):
	#active_plots.push_back(plot)
	#_on_plot_check()

func _on_plot_check(plot: Plantable):
	if can_interact:
		seedPlanted = focus_plot.check_plant.call()
		print(seedPlanted)

#func unregister_plots(plot: Plantable):
	#var index = active_plots.find(plot)
	#if index != -1:
		#active_plots.remove_at(index)


func _process(_delta):
	pass


#func _on_plot_check():
	#if event.is_action_pressed("interact") && can_interact:
		#if active_areas.size() > 0:
			#can_interact = false
				#
			#await active_plot[0].check_plant.call()
			## Since Interact is Callable, we cannot call it like a normal func; we have to use .call()
			## We expect this function to be asynchronous, which depends on how we impletment it in the interaction objects
			#can_interact = true
