extends KinematicBody2D

# constantes para que esten todo el tiempo
const ACCELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -900
const UP = Vector2(0, -1)
const gravity = 40
 


onready var sprite = $Sprite# recopilar informacion de la animacion
onready var animationPlayer = $AnimationPlayer
 
var motion = Vector2()# variable para el movimiento
 
func _physics_process(delta):
	# aplicamos gravedad al personaje
	motion.y += gravity
	var friction = false
 
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("walk")
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		animationPlayer.play("walk")
		sprite.flip_h = false
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		animationPlayer.play("idle")
		friction = true# reproducir animaciones y poner devuelta la friccion
 
	if is_on_floor():# el salto
 
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
 
	motion = move_and_slide(motion, UP)



