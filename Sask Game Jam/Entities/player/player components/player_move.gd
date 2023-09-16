extends CharacterBody2D

@onready var global = get_node("/root/Global")
@export var speed = 400

func _ready():
	global.player = self
	

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()
