extends Node

var tween
# var scale = 0.3
var hoverOffset

var type
var word
var punctuation

signal bubble_pressed( _type, _word, _punctuation )

var destroyed = false

var smallBubbles = [
	preload("res://assets/images/bubble1.png"),
	preload("res://assets/images/bubble2.png"),
	preload("res://assets/images/bubble3.png"),
]
var largeBubbles = []

func _ready():
	tween = get_node('Tween')
	
	set_process(true)

func _process(delta):
	var curPos = get_pos()
	
	# move away from head
	if curPos.length() < 65:
		curPos += curPos.normalized()
	
	# move away from other bubbles
	var bubbles = get_node("../").get_children()
	for i in range(bubbles.size()):
		if bubbles[i] != self:
			var distanceVector = get_pos() - bubbles[i].get_pos()
			if distanceVector.length() < 50:
				curPos += distanceVector.normalized()
	
	# set to new position
	set_pos(curPos)
	
	# set position of hoverNode
	var hoverNode = get_node("HoverNode")
	hoverNode.set_pos(Vector2(0.0, sin(hoverOffset + OS.get_ticks_msec() / 300.0)) * 5)
	
func init(_type, _word, _punctuation):
	var text = _word.replace('_', ' ') + _punctuation
	
	type = _type
	word = _word
	punctuation = _punctuation
	
	# make random numbers random
	randomize()
	
	# initialize random hoverOffset
	hoverOffset = randi() % 5000
	
	# load random bubble image
	var texture = smallBubbles[randi() % smallBubbles.size()]
	
	# set text
	var label = self.get_node("HoverNode/Label")
	label.set_text(text)
	
	# position text properly
	label.set_pos(-texture.get_size() / 2)
	label.set_size(texture.get_size())
	
	# set texture on button and reposition
	var button = self.get_node("HoverNode/Button")
	button.set_normal_texture(texture)
	button.set_pos(-texture.get_size() / 2)
	
	# add listeners to button
	button.connect("mouse_enter", self, "_mouse_enter")
	button.connect("mouse_exit", self, "_mouse_exit")
	button.connect("pressed", self, "_pressed")
	
	# set position
	var pos = Vector2(randi() % 100 - 50, randi() % 100 - 80).normalized() * 40
	set_pos(pos)

func _mouse_enter():
	if not destroyed:
		get_node("Audio").play("click_out")
		tween.interpolate_property(self, "transform/scale", get_scale(), Vector2(1,1), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func _mouse_exit():
	if not destroyed:
		# get_node("Audio").play("click_out")
		tween.interpolate_property(self, "transform/scale", get_scale(), Vector2(0.8,0.8), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

func _pressed():
	if not destroyed:
		destroy()
		emit_signal("bubble_pressed", type, word, punctuation)

func destroy(delay = 0):
	if destroyed == false:
		get_node("Audio").play("bubble")
		destroyed = true
		tween.interpolate_property(self, "transform/scale", get_scale(), Vector2(0,0), 0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT, delay)
		tween.connect("tween_complete", self, "remove_node")
		tween.start()

func remove_node(a=0,b=0):
	queue_free()
	