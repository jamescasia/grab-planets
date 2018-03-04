extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var arm = get_node("../player/arm")
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	arm.set_linear_velocity(Vector2(0,320))

	
	# Called every time the node is added to the scene.
	# Initialization here
	pass
