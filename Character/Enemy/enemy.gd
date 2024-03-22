extends CharacterBody2D
var speed=100.0
var body_entered=false
var player_body
const MAX=100
var distance=MAX
var health=100
func _ready():
	$AnimatedSprite2D.play("move")
	$EnemyHealth.value=health
func _on_attack_area_body_entered(body):
	player_body=body
	body_entered=true
		
func _process(delta):
	if body_entered:
		move()
		if distance<=10:
			player_body.hit()
func move():
	var direction=global_position.direction_to(player_body.global_position).normalized()
	distance=position.distance_to(player_body.position)
	velocity=direction*speed
	move_and_slide()

func _on_attack_area_body_exited(body):
	body_entered=false
func enemy_hit():
	health-=10
	$EnemyHealth.value=health
	if health<=0.0:
		queue_free()
	
