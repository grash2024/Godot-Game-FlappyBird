extends Panel
var index=0
var msg_array=[]
var next_msg=false
func _ready():
	var file=FileAccess.open("user://dialogue_info.json",FileAccess.READ)
	msg_array=JSON.parse_string(file.get_as_text())
	file.close()
	display_msg()
func _input(event):
	if event.is_action_pressed("msg") and next_msg:
		print(index)
		display_msg()
func display_msg():
	if index<=3:
		$RichTextLabel2.text=msg_array[index]["msg_one"]
		$RichTextLabel.text=msg_array[index]["msg_two"]
		index+=1
	else:
		next_msg=false
		index=0
		display_msg()
		self.hide()
