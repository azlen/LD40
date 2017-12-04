extends Node2D

var meter_fill
var percentage = 1
var moving = false

var speed = 2

signal meter_reset

func _ready():
	meter_fill = get_node("meterFill")
	
	set_process(true)

func _process(delta):
	if moving:
		add_percentage(-speed * delta)


func add_percentage(percent):
	if moving:
		percentage += percent
		percentage = max(min(percentage, 1), 0)
	else:
		moving = true
	
	if percentage == 0:
		moving = false
		emit_signal("meter_reset")
		percentage = 1
	
	update_meter()

func update_meter():
	meter_fill.set_scale(Vector2(min(percentage, 1), 1))
	
	var color
	if not moving:
		color = Color(1, 1, 1)
	elif percentage > 0.7:
		color = Color(0.3, 1, 0.1)
	elif percentage > 0.3:
		color = Color(0.9, 0.9, 0.1)
	else:
		color = Color(1, 0.3, 0.1)
	
	meter_fill.set_modulate(color)