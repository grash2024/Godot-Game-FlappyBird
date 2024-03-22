extends CharacterBody2D
var speed=100.0
var max_speed=500.0
var speed_limit=100.0
const ACCELERATION=100.0
const FRICTION=100.0
func _ready():
	Globals.player_health=100.0
func _process(delta):
	if Input.is_action_just_pressed("stomp"):
		$AnimationPlayer.play("stomp")
	if Input.is_action_just_pressed("run"):
		speed=max_speed
		$AnimatedSprite2D.play("run")
	if Input.is_action_just_released("run"):
		speed=speed_limit
	var input_axis=Input.get_vector("left","right","top","bottom")
	if input_axis!=Vector2.ZERO:
		player_acceleration(input_axis,delta,speed)
	else:
		player_friction(delta)
	move_and_slide()
	
func player_acceleration(input_axis:Vector2,delta:float,speed:float)->void:
	$AnimatedSprite2D.play("walk")
	if input_axis.x<0:
		$AnimatedSprite2D.flip_h=true
	else:
		$AnimatedSprite2D.flip_h=false
	velocity.x=move_toward(velocity.x,input_axis.x*speed,ACCELERATION*delta)
	velocity.y=move_toward(velocity.y,input_axis.y*speed,ACCELERATION*delta)

func player_friction(delta:float)->void:
	$AnimatedSprite2D.play("idle")
	velocity.x=move_toward(velocity.x,0,FRICTION*delta)
	velocity.y=move_toward(velocity.y,0,FRICTION*delta)
func hit():
	Globals.player_health-=0.2
	if Globals.player_health<=0.0:
		queue_free()
	
	


func _on_stomp_attack_body_entered(body):
	body.enemy_hit()
