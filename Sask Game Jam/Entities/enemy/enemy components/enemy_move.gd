extends CharacterBody2D

@export var speed = 200
@export var score_val = 10
@export var backoff_range = 120 #the distance which the enemy begins to backoff.
@export var attack_range = 20 #the distance which the enemy stays still and attacks. Added onto backoff_range

@onready var global = get_node("/root/Global")
@onready var _animation_player = $AnimationPlayer

var player: Node2D = self
var p_chase = false
var p_patrol = false


#the player's Collision layer is on 1 and Enemies exist layer 2.

func _physics_process(delta):
	velocity = position.direction_to(global.player.position) * speed

	if position.distance_to(global.player.position) > backoff_range + attack_range:
		_animation_player.play("walk")
		move_and_slide()
	elif position.distance_to(global.player.position) < backoff_range:
		_animation_player.play("walk")
		velocity = -velocity
		move_and_slide()
	else:
		_animation_player.play("attack")
		
	### Change direction of sprite based on mouse ###
	look_at(global.player.position)


func _on_health_health_zero():
	global.score += score_val
	queue_free() #this basically deletes the entire enemy.
