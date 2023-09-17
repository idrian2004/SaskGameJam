extends CharacterBody2D

@onready var global = get_node("/root/Global")
@export var speed = 400

@onready var _animation_player = $AnimationPlayer


func _ready():
	global.player = self	

func get_input():
	#this determines the x and y axis of movement respectively
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = input_direction * speed
	
	if velocity == Vector2.ZERO:
		_animation_player.play("Idle")
	else:
		_animation_player.play("ant_walk")


func _physics_process(_delta):
	get_input()
	move_and_slide()
	look_at(get_global_mouse_position())


func _on_health_health_zero():
	print("oh shit, I'm dead") #remove this with a game over screen or something.
