extends CharacterBody2D
var direction=Vector2.ZERO
var state
var speed=100
var vel
var player_body
var show_dialogue=false
enum NPCState{
	idle,
	direction,
	move
}
func _ready():
	randomize()
func _process(delta):
	if Input.is_action_just_pressed("talk") and show_dialogue:
		player_body.get_parent().get_node("CanvasLayer/Dialogue").show()
		player_body.get_parent().get_node("CanvasLayer/Dialogue").next_msg=true
		show_dialogue=false
	state=randomizing([NPCState.idle,NPCState.move])
	match state:
		NPCState.idle:
			$AnimatedSprite2D.play("idle")
		NPCState.move:
			move()

func randomizing(arr:Array):
	arr.shuffle()
	return arr.front()
	
func move():
	velocity=direction*speed
	move_and_slide()





func _on_timer_timeout():
	direction=randomizing([Vector2.LEFT,Vector2.RIGHT,Vector2.UP,Vector2.DOWN])

func _on_talk_area_body_entered(body):
	player_body=body
	show_dialogue=true
	
	
