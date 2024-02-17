extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if (body.name == "BlueShip"):
		print("Reached objective!")
		
		$"../WinMessage".visible = not $"../WinMessage".visible
		
		yield(get_tree().create_timer(1.0), "timeout")
		
		get_tree().quit()
