extends Node2D

onready var a = get_node("Sprite")
onready var b = get_node("Sprite1") 
func _ready(): 
	pass


func _on_Button_pressed(): 
	get_tree().reload_current_scene()
	pass # replace with function body


func _on_Button_button_up():
	a.set_hidden(false)
	b.set_hidden(true)
	a.set_scale(Vector2(1,1))
	b.set_scale(Vector2(1,1))
	pass # replace with function body


func _on_Button_button_down():
	b.set_hidden(false)
	a.set_hidden(true)
	a.set_scale(Vector2(0.93,0.93))
	b.set_scale(Vector2(0.93,0.93))
	pass # replace with function body
