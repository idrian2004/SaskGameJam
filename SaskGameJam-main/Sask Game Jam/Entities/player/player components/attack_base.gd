extends Node2D

@onready var global = get_node("/root/Global")
@onready var _animation_player = $AnimationPlayer
@onready var hitbox = $Attack_Hitbox

@export var animation_name = "auto_attack_test" #this is what the animation file is called
@export var attack_time = 5
@export var damage:int = 30

@export var scaling_factor:int = 0 #the attack grows stronger everytime the banked score hits a multiple of this number.
@export var scaling_damage: int = 10 #how much the attacks scales

var timer = Timer.new()
var is_attacking = false



func _ready():
	hitbox.damage = damage
	add_child(timer) #adds a timer
	timer.timeout.connect(_on_timer_timeout)
	timer.wait_time = attack_time
	timer.start()


func _on_timer_timeout():
		if scaling_factor != 0 and global.banked_score % scaling_factor == 0 :
			damage += scaling_damage
		
		_animation_player.play(animation_name)
