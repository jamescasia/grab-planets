extends Camera2D

# class member variables go here, for example:
# var a = 2
onready var label1 = get_node("hud/Label")
onready var label2 = get_node("Label1")
onready var planet = get_node("../platforms")
onready var cloudanim = get_node("AnimationPlayer")
onready var player = get_node("../player")
onready var viewport = get_viewport()

var minimum_size = Vector2(480, 746)

# var b = "textvar"

func _ready():
	cloudanim.set_speed(0.3)
#	viewport.connect("size_changed", self, "window_resize")
#	window_resize()
#	#label1.set_pos(Vector2(0	,0))
#	
	
	set_fixed_process(true)
func _fixed_process(delta):
	#if(player.get("starting")):
		#label1.set_pos(Vector2(0, label1.get_pos().y +30 ))
	set_pos(Vector2(0 ,   player.get_pos().y -800))
	label1.set_text(str(player.get("score")))
	#label1.set_pos(Vector2(get_pos().x	,get_pos().y  ))
	
	 


 
    

#func window_resize():
#    var current_size = OS.get_window_size()
#
#    var scale_factor = minimum_size.y/current_size.y
#    var new_size = Vector2(current_size.x*scale_factor, minimum_size.y)
#
#    if new_size.y < minimum_size.y:
#        scale_factor = minimum_size.y/new_size.y
#        new_size = Vector2(new_size.x*scale_factor, minimum_size.y)
#    if new_size.x < minimum_size.x:
#        scale_factor = minimum_size.x/new_size.x
#        new_size = Vector2(minimum_size.x, new_size.y*scale_factor)
#
#    viewport.set_size_override(true, new_size)
