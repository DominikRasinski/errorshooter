extends CharacterBody2D

class_name Glitched_Enemy

@export var speed = 100;
@export var rotation_speed = 5.0; # Szybkość obrotu (wyższa wartość = szybszy obrót)

@onready var light: CanvasModulate = get_tree().current_scene.get_node("CanvasModulate")

var _player = null;
var _player_position = null;

var dead = false;

func _ready():
	add_to_group("glitched_enemy")

	
func _physics_process(delta: float) -> void:
	_player = get_parent().get_node("CanvasModulate/Player")

	if _player:
		var dir = _player.global_position - global_position;
		
		# Oblicz kąt do gracza
		var target_angle = dir.angle();
		
		# Płynny obrót w kierunku gracza
		rotation = lerp_angle(rotation, target_angle, rotation_speed * delta);
		
		velocity = dir.normalized() * speed;
		move_and_slide();
		
	if dead:
		light.color = "#000"
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameManager.set_health(GameManager.get_health() - 1)
