@tool
extends Control

@export var character_box: PackedScene
@onready var character_container: VBoxContainer = %CharacterContainer

# Note: Maybe have a Dictionary of characters and import them one at a time to avoid duplicates.
# If a duplicate appears, put it in a separate list and warn the user that there are duplicates.
# The separate list would be an array that needs to be resolved in a separate window.

func _on_create_button_pressed() -> void:
	var new_character := character_box.instantiate() as GameManager__CharacterBox
	var character_info := (GameManager__CharacterInfo.new()
	 .set_id(randi() % 50)
	 .set_char_name("Gandalf")
	 .set_description("The great.")
	 .set_type(GameManager__CharacterInfo.CharacterType.NPC))
	new_character.character_info = character_info
	new_character.delete_button.pressed.connect(_on_delete_button_pressed.bind(new_character.character_info))

	character_container.add_child(new_character)
	var sorted_characters := character_container.get_children()
	sorted_characters.sort_custom(
		func(a: GameManager__CharacterBox, b: GameManager__CharacterBox) -> bool: \
			return a.character_info.id < b.character_info.id
	)
	
	for node in character_container.get_children():
		character_container.remove_child(node)

	for node in sorted_characters:
		character_container.add_child(node)

## Note: The ID of this has an issue where two IDs can be the same and conflict here.
## I would recommend warning the user that the ID is already in use whenever sorting.
## It'll slow down the sorting process but there should never be so many characters that it's a problem.
## Let's be honest, it isn't until you have thousands of characters that it becomes a problem.
## At that point, a database would be a better solution. Or even separating the characters into different files.
## We could try importing all the characters and then warning the user that some IDs are conflicting.
## But truly the best solution would be to use an SQLite database so we can enforce unique IDs and perform queries.
## Alternatively, since we don't expect a ton of characters, we could perform a "Unique ID" on the character.
func _on_delete_button_pressed(character_info: GameManager__CharacterInfo) -> void:
	pass
