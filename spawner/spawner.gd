extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 2.0;

var _timer: Timer;
var _spawn_points: Array;

func _ready():
	_spawn_points = get_children().filter(func(c): return c is Marker2D);
	
	_timer = Timer.new();
	_timer.wait_time = spawn_interval
	_timer.autostart = true;
	_timer.one_shot = false;
	add_child(_timer)
	_timer.timeout.connect(_spawn_enemy);
	
func _spawn_enemy():
	if _spawn_points.is_empty():
		return;
		
	var point: Marker2D = _spawn_points.pick_random();
	
	var enemy = enemy_scene.instantiate();
	enemy.global_position = point.global_position
	
	get_tree().current_scene.add_child(enemy)
