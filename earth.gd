extends Node2D
#FRIENDLY PLANETS ONLY  NORMAL PLANETS
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#TYPES OF PLATFORMS NORMAL , INSTAEXLPODING(MUST NOT LAND), ABERRANT (VARYING SPEEDS), AFTEREXPLODING
var pos 
var speed
var posplus 
 
onready var collider = get_node("PlanetBody") 
func _ready():
	randomize() 
	speed = int(rand_range( 0,700))
	set_fixed_process(true)
	pos = Vector2( int(rand_range(40,420) ), 350)
	
	
	pass
func _fixed_process(delta):  
	if !Globals.get("globalStillFiring")  :
		orbit(delta)
		
	 
func orbit(delta):
	set_pos(pos)
	if pos.x >=425 and pos.x <=435:
		posplus = true
	if pos.x >= 40 and pos.x <= 50:
		posplus = false
	if posplus : 
		pos.x-=speed*delta 
	elif !posplus :
		pos.x+=speed*delta 
 
		
		
	
