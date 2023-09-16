extends Node

var timer = Timer.new()
var player:Node2D
var score: int = 0
var banked_score: int = 0

func _ready():
	add_child(timer) #adds a timer
	timer.timeout.connect(_on_timer_timeout) #connects a signal. Basically this allows the script to sense when the timer goes out.
	timer_reset()

func timer_reset():
	timer.wait_time = 60
	timer.start()
	
func _on_timer_timeout():
	timer.stop()
	

func _physics_process(delta):
	score = int(timer.time_left)
