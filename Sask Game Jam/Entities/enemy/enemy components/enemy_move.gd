extends CharacterBody2D

@export var speed = 200
@export var effetive_range = 200

var player: Node2D
var p_chase = false
var p_patrol = false

#the player's Collision layer is on 1 and Enemies exist layer 2.

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_detection_area_body_exited(body):
	if body.is_in_group("player"):
		player = null
	

func _physics_process(delta):
	if player != null and position.distance_to(player.position) >= effetive_range:
		velocity = position.direction_to(player.position) * speed
		
		move_and_slide()
