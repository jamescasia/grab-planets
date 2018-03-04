extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var anim = get_node("AnimationPlayer")
onready var anim1 = get_node("Node2D 2/AnimatedSprite")
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	anim1.set_frame(1)
	pass
func _fixed_process(delta):
	pass
	


func _on_AnimationPlayer_finished():
	get_tree().change_scene("main.tscn")
	pass # replace with function body
