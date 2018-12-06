extends Node2D

const ROOM = preload("res://Room/Room.tscn")

onready var camera = $Camera2D
onready var hud = $HUD
onready var rooms = $Rooms

var n_rooms
var min_size
var max_size
var h_spread
var tile_size = 32

func _ready():
	randomize()
	update_values()
	generate_rooms()


func update_values():
	var v = hud.get_values()
	n_rooms = v.n_rooms
	min_size = v.min_size
	max_size = v.max_size
	h_spread = v.h_spread


func generate_rooms():
	for r in rooms.get_children():
		r.queue_free()
	
	for i in range(n_rooms):
		var pos = Vector2(rand_range(-h_spread, h_spread), 0)
		var w = min_size
		var h = min_size
		if min_size != max_size:
			w += randi() % (max_size - min_size)
			h += randi() % (max_size - min_size)
		
		var r = 2 * i / float(n_rooms)
		var g = 2 - 2 * i / float(n_rooms)
		
		var room = ROOM.instance()
		room.generate(pos, Vector2(w, h) * tile_size, Color(r, g, 0))
		rooms.add_child(room)


func _unhandled_input(event):
	if event.is_action_pressed("zoom+"):
		camera.zoom /= 1.1
	elif event.is_action_pressed("zoom-"):
		camera.zoom *= 1.1


func _on_HUD_generate_pressed():
	generate_rooms()


func _on_HUD_values_changed():
	update_values()
