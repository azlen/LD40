extends Node2D

var tween
var button

func _ready():
	tween = get_node("Tween")
	button = get_node("Button")
	button.connect("mouse_enter", self, "_mouse_enter")
	button.connect("mouse_exit", self, "_mouse_exit")
	button.connect("pressed", self, "_pressed")

func _mouse_enter():
	get_node("Audio").play("click_out")
	tween.interpolate_property(self, "transform/scale", get_scale(), Vector2(1.2,1.2), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _mouse_exit():
	#get_node("Audio").play("click_out")
	tween.interpolate_property(self, "transform/scale", get_scale(), Vector2(1, 1), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _pressed():
	get_tree().get_root().get_node("Game").switch_scene("house")
	_mouse_exit()