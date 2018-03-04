extends Polygon2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var player = get_node("../../player")
var addend  = 0
var color
func _ready():
	set_fixed_process(true)
	set_color(Color(0.1255  , 0.2196 ,0.3922 )) 
	
func _fixed_process(delta):
	
	color = Color(0.1255 + addend, 0.2196+ addend,0.3922+addend)
	#color = Color(0,0,0)
	 
	set_color(color)
	pass

func _on_player_upping():
	addend=   addend-0.0085
	
