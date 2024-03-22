extends Control
func _ready():
	PlayerHealthUi.hide()
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	PlayerHealthUi.show()
	

func _on_quit_button_pressed():
	get_tree().quit()
