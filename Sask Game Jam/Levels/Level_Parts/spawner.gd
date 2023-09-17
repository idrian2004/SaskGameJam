extends Node2D

const Enemy1: PackedScene = preload("res://Entities/enemy/spider_enemy.tscn")
const Enemy2: PackedScene = preload("res://Entities/enemy/Mite.tscn")

var timer = Timer.new()
var rng = RandomNumberGenerator.new()

@export var spawn_time: int = 10


func _on_timer_timeout():
	spawn_enemies()

func spawn_enemies():
	var rand_num = rng.randf_range(0.0, 10.0)
	var enemy
	if rand_num > 8:
		enemy = Enemy2.instantiate()
	else:
		enemy = Enemy1.instantiate()
	get_parent().add_child.call_deferred(enemy)
	enemy.position = position
	
	
func _ready():
	spawn_enemies()
	
	add_child(timer) #adds a timer
	timer.timeout.connect(_on_timer_timeout) #connects a signal. Basically this allows the script to sense when the timer goes out.
	timer.wait_time = spawn_time
	timer.start()
