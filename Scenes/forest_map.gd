extends TileMap
var matched_key=false

func _on_area_2d_body_entered(body):
	matched_key=true
	
func _input(event):
	if Input.is_action_just_pressed("open_door")and matched_key:
		get_tree().change_scene_to_file("res://Scenes/cave.tscn")

func _on_area_2d_body_exited(body):
	matched_key=false
