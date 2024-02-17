extends Area2D

var second_level = preload("res://scenes/SecondLevel.tscn")

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
		
		$"../WinMessage".visible = not $"../WinMessage".visible
		
		yield(get_tree().create_timer(1.0), "timeout")
		
		get_tree().change_scene_to(second_level)
