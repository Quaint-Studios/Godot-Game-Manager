@tool
class_name GameManager__CharacterBox extends Control

@export var background: Panel
@export var delete_button: TextureButton

@export var character_image: TextureRect
@export var character_id: Label
@export var character_name: Label

var character_info: GameManager__CharacterInfo:
	set(val):
		character_info = val
		update_info(character_info)
	get:
		return character_info if character_info else GameManager__CharacterInfo.new()

func _on_ready():
	if background == null: background = %Background as Panel
	if delete_button == null: delete_button = %Delete as TextureButton
	if character_image == null: character_image = %Image as TextureRect
	if character_id == null: character_id = %ID as Label
	if character_name == null: character_name = %Name as Label

func update_info(character_info: GameManager__CharacterInfo):
	print(%Image, character_image, character_id, character_name, background)
	character_image.texture = character_info.image
	character_id.text = "%d (%s)" % [character_info.id, GameManager__CharacterInfo.CharacterType.keys()[character_info.type]]
	character_name.text = character_info.name

# Main Button UI/UX Signals
func _on_button_mouse_entered() -> void:
	var bg_modulate := background.modulate
	background.modulate = Color(0.65, 0.65, 0.65, 1)

func _on_button_mouse_exited() -> void:
	var bg_modulate := background.modulate
	background.modulate = Color(0.85, 0.85, 0.85, 1)

func _on_button_button_up() -> void:
	var bg_modulate := background.modulate
	background.modulate = Color(bg_modulate.r, bg_modulate.g, bg_modulate.b, 1)

func _on_button_button_down() -> void:
	var bg_modulate := background.modulate
	background.modulate = Color(bg_modulate.r, bg_modulate.g, bg_modulate.b, 0.75)

# Delete Button UI/UX Signals
func _on_delete_mouse_entered() -> void:
	delete_button.modulate = Color(1, 0, 0, 1)

func _on_delete_mouse_exited() -> void:
	delete_button.modulate = Color(1, 1, 1, 1)

func _on_delete_button_up() -> void:
	var d_modulate := delete_button.modulate
	delete_button.modulate = Color(d_modulate.r, d_modulate.g, d_modulate.b, 1)

func _on_delete_button_down() -> void:
	var d_modulate := delete_button.modulate
	delete_button.modulate = Color(d_modulate.r, d_modulate.g, d_modulate.b, 0.75)
