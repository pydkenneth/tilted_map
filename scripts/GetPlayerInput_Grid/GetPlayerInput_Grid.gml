///@desc sign input signals to obj variables
keyLeft = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
keyRight = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp !=0);