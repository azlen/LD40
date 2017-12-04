extends Node2D

var head
var face
var body
var offset

var move_face = true

func _ready():
	head = get_node("Head")
	face = get_node("Face")
	body = get_node("Body")

func _process(delta):
	var bodySin = sin(offset + OS.get_ticks_msec() / 300.0)
	body.set_pos(Vector2(0, bodySin * 7))
	body.set_scale(Vector2(1 - bodySin * 0.02, 1 - bodySin * 0.02))
	if move_face:
		face.set_pos(Vector2(0, sin(offset + 1 + OS.get_ticks_msec() / 422.0) * 4))

func init(path):
	var file2Check = File.new()
	if file2Check.file_exists(path + "/head.png"):
		head.set_texture(load(path + "/head.png"))
		face.set_texture(load(path + "/face.png"))
		body.set_texture(load(path + "/body.png"))
	
	randomize()
	offset = randi() % 5000
	
	set_process(true)