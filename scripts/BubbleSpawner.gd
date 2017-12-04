extends Node2D

func _ready():
	pass

func spawn_bubble(_type, _word, _punctuation):
	# create bubble instance
	var bubble = load("res://entities/SpeechBubble.tscn")
	var bubble_instance = bubble.instance()
	
	# initialize bubble
	bubble_instance.init(_type, _word, _punctuation)
	
	# add bubble as child
	add_child(bubble_instance)
	
	return bubble_instance

func handle_bubble_click():
	pass

func init_bubbles():
	pass
	