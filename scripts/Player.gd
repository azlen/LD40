extends Node2D

var character
var bubble_container

func _ready():
	character = get_node("Character")
	bubble_container = get_node("BubbleContainer")
	character.init("res://assets/images/characters/player")
	character.move_face = false
	
	set_process(true)

func _process(delta):
	var mouse = get_viewport().get_mouse_pos()
	var distanceVector = mouse - bubble_container.get_global_transform_with_canvas().o
	character.face.set_pos(Vector2(-5, 0) + distanceVector / 50.0)