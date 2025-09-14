extends CharacterBody2D

class_name Player

@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = %AudioStreamPlayer2D


@export var speed = 400;
@export var fire_rate: float = 0.2;
@onready var bullet_scene: PackedScene = preload("res://utils/bullet.tscn");

var _can_shoot = true;

func _ready() -> void:
	point_light_2d.visible = false;

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down");
	velocity = input_direction * speed;
	look_at(get_global_mouse_position());

func _physics_process(delta: float) -> void:
	get_input();
	move_and_slide();
	is_shoot();

func is_shoot():
	if Input.is_action_pressed("shoot") and _can_shoot:
		audio_stream_player_2d.play();
		shoot();
		
func shoot():
	_can_shoot = false;
	var bullet = bullet_scene.instantiate();
	
	bullet.global_position = global_position
	
	var dir = (get_global_mouse_position() - global_position).normalized()
	bullet.direction = dir;
	
	get_tree().current_scene.add_child(bullet);
	
	await get_tree().create_timer(fire_rate).timeout
	_can_shoot = true;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
