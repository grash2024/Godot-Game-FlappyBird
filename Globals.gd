extends Node
var player_health=100.0:
	set(value):
		player_health=value
		var health_bar=PlayerHealthUi.get_node("Panel/PlayerHealthBar") as ProgressBar
		health_bar.value=player_health
	get:
		return player_health

var boss_health=100
var highscore=0
var kill=0
