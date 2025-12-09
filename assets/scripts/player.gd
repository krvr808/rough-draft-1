class_name Player extends CharacterBody2D

#--------VARIABLES-------------------------------------------------------------------------------------------------------------
var normalspeed = 100.0
var JUMP_VELOCITY = -100.0
var wall_slide_speed = 50
var wall_slide_gravity = 50

var hit = true

var dashing = false
const dashspeed = 1000
var can_dash = true

@export var max_wall_jump_count: int = 1

var wall_jump_count: int = 0;
var is_wall_sliding : bool;

var health: int = 3;
var child_count: int = 0;



@export var heart_containers: HeartContainers;
@export var child_containers: ChildsMark;

#----------------------GRAVITY-----------------------------------------------------------------------------
func _physics_process(delta):
	heart_containers.update_health(health);
	child_containers.update_yeschild(child_count);
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	#----------------BASICMOVEMENT---------------------------------------------------------------------
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("ui_right"):
		velocity.x = normalspeed 
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_just_pressed("ui_left"):
		velocity.x = -normalspeed
		$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = 0
	
	#-------------DASHING----------------------------------------------------------------
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if dashing:
			velocity.x = direction * dashspeed
		else:
			velocity.x = direction * normalspeed
	else:
		velocity.x = move_toward(velocity.x, 0, normalspeed)

#-----------------------CROUCH------------------------------------------------------------------------------------
	if Input.is_action_pressed("Crouch"):
		$CrouchShape.disabled = false
		$NormalShape.disabled = true
	
		normalspeed = 120
		JUMP_VELOCITY = -45
	
	
	else:
		$CrouchShape.disabled = true
		$NormalShape.disabled = false
		$AnimatedSprite2D.position.x = 0
		$AnimatedSprite2D.position.y = 0
		$AnimatedSprite2D.scale.x = 0.969
		$AnimatedSprite2D.scale.y = 1
		
		normalspeed = 200
		JUMP_VELOCITY = -300
	#--------------------WALLSLIDE-------------------------------------------------------------------------------------------------------
	if is_on_wall() and !is_on_floor():
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			is_wall_sliding = true
		else:
			is_wall_sliding = false
	else:
		is_wall_sliding = false
	if is_wall_sliding:
		velocity.y += (wall_slide_gravity * delta)
		velocity.y = min(velocity.y, wall_slide_speed)
		
		#----------------WALLJUMP-----------------------------------------------------------------------------------------------
	if Input.is_action_just_pressed("Jump"):
		if is_on_floor():
			wall_jump_count = 0;
			velocity.y = JUMP_VELOCITY
		if is_on_wall() && Input.is_action_pressed("ui_right") && !(wall_jump_count > max_wall_jump_count):
			wall_jump_count+=1
			velocity.y = JUMP_VELOCITY
		elif is_on_wall() && Input.is_action_pressed("ui_left") && !(wall_jump_count > max_wall_jump_count):
			velocity.y = JUMP_VELOCITY
			wall_jump_count+=1
			
			#-------------DASH------------------------------------------------------------------------------------------
	if Input.is_action_just_pressed("Dash") and can_dash:
		dashing = true
		can_dash = false 
		$dash_timer.start()
		$dash_again_timer.start()
		
		
	if dashing: 
		velocity.x = direction * dashspeed
	else: 
		velocity.x = direction * normalspeed
		#---------------hit by turret take damage----------------------------------------------------
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
#-----------------------------------------------------------------------------------
	move_and_slide()
	
#----------TIMERS--------------------------------------------------------------------
# to stop dashing
func _on_timer_timeout() -> void:
	dashing = false;

func take_damage() -> void:
	health-=1;
	

func gain_child() -> void:
	child_count +=1

func _on_dash_again_timer_timeout() -> void:
	can_dash = true
