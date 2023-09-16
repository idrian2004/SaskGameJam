extends Node

var timer = Timer.new()
var player:Node2D
var score: int = 100
var banked_score

func _ready():
	add_child(timer)
	timer.wait_time = 60
	timer.start()
	
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	pass
	

func _physics_process(delta):
	score = int(timer.time_left)
