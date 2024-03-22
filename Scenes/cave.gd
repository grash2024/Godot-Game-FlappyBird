extends TileMap
var key_match=false
var boss_fight_mode=true
var boss_enemy_scene=preload("res://Character/Enemy/enemy.tscn")
func _ready():
	$CanvasLayer/Dialogue.hide()
func _input(event):# it will be called on any of the event occurs here when you move up and down or left right or attack
	if event.is_action_pressed("open_door") and key_match:
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if event.is_action_pressed("boss_fight") and $Enemies.get_children().size()<=0 and boss_fight_mode:
		boss_fight_mode=false
		var boss_enemy=boss_enemy_scene.instantiate() as CharacterBody2D
		boss_enemy.global_position=$BossSpawnLocation.global_position
		var boss_enemy_animated_sprite=boss_enemy.get_node("AnimatedSprite2D") as AnimatedSprite2D
		boss_enemy_animated_sprite.scale=Vector2(8.0,8.0)
		var boss_enemy_collison_shape=boss_enemy.get_node("AttackArea/CollisionShape2D") as CollisionShape2D
		boss_enemy_collison_shape.scale=Vector2(30.0,30.0)
		$Enemies.add_child(boss_enemy)

func _on_area_2d_body_entered(body):
	key_match=true

func _on_area_2d_body_exited(body):
	key_match=false
