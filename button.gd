extends Node2D

# class member variables go here, for example:
onready var viewport = get_viewport()
onready var exit = get_node("../exit")
var minimum_size = Vector2(480, 800)
onready var a = get_node("Sprite")
onready var k = get_node("k")
onready var anim  = get_node("../AnimationPlayer")
onready var b = get_node("Sprite1")
var ass = preload("res://Game.tscn")

var asss = preload("res://menu.tscn")
var asses = preload("res://exit.tscn")
var assnicam = preload("res://intro.tscn") 
func _ready():
	get_tree().set_auto_accept_quit(false)
	exit.set_hidden(true)
	viewport.connect("size_changed", self, "window_resize")
	window_resize()
#	
	
	
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Button_button_down(): 
	b.set_hidden(false)
	anim.stop_all()
	a.set_hidden(true)
	a.set_scale(Vector2(0.98, 0.98))
	b.set_scale(Vector2(0.98, 0.98))
	print("up")
	pass # replace with function body
func window_resize():
    var current_size = OS.get_window_size()

    var scale_factor = minimum_size.y/current_size.y
    var new_size = Vector2(current_size.x*scale_factor, minimum_size.y)

    if new_size.y < minimum_size.y:
        scale_factor = minimum_size.y/new_size.y
        new_size = Vector2(new_size.x*scale_factor, minimum_size.y)
    if new_size.x < minimum_size.x:
        scale_factor = minimum_size.x/new_size.x
        new_size = Vector2(minimum_size.x, new_size.y*scale_factor)

    viewport.set_size_override(true, new_size)

func _on_Button_button_up():
	anim.play("New Anim")
	a.set_hidden(false)
	b.set_hidden(true)
	a.set_scale(Vector2(1, 1))
	b.set_scale(Vector2(1, 1))

func _on_Button_pressed():
	get_tree().change_scene("res://Game.tscn")
	pass # replace with function body
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		exit.set_hidden(false)
		
		
