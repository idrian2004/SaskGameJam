extends Area2D

@export var is_player = false
@export var damage = 0

@onready var global = get_node("/root/Global")



func _on_body_entered(body):
	if is_player and body.is_in_group("enemy"):
		body.get_node("Health").take_damage(damage)
		
	elif !is_player and body.is_in_group("player"):
		body.get_node("UI").get_node("Health").take_damage(damage * global.difficulty)
