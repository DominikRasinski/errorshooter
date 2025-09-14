extends Node

const LEVEL1 = preload("res://levels/level_1.tscn");

const GAMEOVER = preload("res://control/game_over.tscn");
const GAMEWIN = preload("res://control/game_win.tscn");
const GAMEMENU = preload("res://control/main_menu.tscn")

var _game_over = null;
var _game_win = null;
var _game_menu = null;
var _kills = 0;
var _health = 5;
var _win_kills = 1;

func _ready() -> void:
	_game_over = GAMEOVER.instantiate();
	_game_win = GAMEWIN.instantiate();

func loadLevel():
	self.set_health(5)
	self.set_kills(0)
	get_tree().change_scene_to_packed(LEVEL1);
	
func load_main_menu():
	self.set_health(5)
	self.set_kills(0)
	get_tree().change_scene_to_packed(GAMEMENU);

func quitGame():
	get_tree().quit();

func get_game_over():
	return _game_over;
	
func get_game_win():
	return _game_win;	
	
func set_kills(kill: int):
	_kills += kill;

func get_kills() -> int:
	return _kills;
	
func get_health() -> int:
	return _health;
	
func set_health(health: int):
	_health = health; 

func get_win_kills() -> int:
	return _win_kills;
