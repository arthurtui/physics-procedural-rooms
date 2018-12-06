extends CanvasLayer

onready var max_slider = $VBoxContainer/GridContainer/MaxSlider
onready var label_n_rooms = $VBoxContainer/GridContainer/RoomsNumber
onready var label_min_size = $VBoxContainer/GridContainer/MinNumber
onready var label_max_size = $VBoxContainer/GridContainer/MaxNumber
onready var label_h_spread = $VBoxContainer/GridContainer/SpreadNumber

signal generate_pressed
signal values_changed

var values = {
	n_rooms = 40,
	min_size = 4,
	max_size = 6,
	h_spread = 100
}

func get_values():
	return values


func _on_RoomsSlider_value_changed(value):
	values.n_rooms = int(value)
	label_n_rooms.text = str(value)
	emit_signal("values_changed")


func _on_MinSlider_value_changed(value):
	values.min_size = int(value)
	label_min_size.text = str(value)
	max_slider.min_value = value
	max_slider.visible = max_slider.min_value != max_slider.max_value
	emit_signal("values_changed")


func _on_MaxSlider_value_changed(value):
	values.max_size = int(value)
	label_max_size.text = str(value)
	emit_signal("values_changed")


func _on_SpreadSlider_value_changed(value):
	values.h_spread = int(value)
	label_h_spread.text = str(value)
	emit_signal("values_changed")


func _on_Generate_pressed():
	emit_signal("generate_pressed")
