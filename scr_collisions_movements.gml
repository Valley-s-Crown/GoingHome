///scr_collisions_movement()
/*
Check will replace the directional movement 
and check if the next pixel is free to move 
into. It will then move the object as far as
it can based on how many pixels are available.
*/

//Gets both checks ready
h_check = h_spd;
h_spd = 0;

v_check = v_spd;
v_spd = 0;
//Begins an almost grid like search in order to find any possible diagonal collisions
//Starts with horizontal collisions
while (h_check != 0 || v_check != 0) {
	if (place_meeting(x + h_spd + sign(h_check), y, obj_solid)) {
		h_check = 0;
	} else {
		h_spd += sign(h_check);
		h_check -= sign(h_check);
	}
	//resets vertical check if needed
	if (v_spd != 0) {
		v_check = v_spd;
		v_spd = 0;
	}
	//does vertical collisions at every possible x position
	while(v_check != 0) {
		if (place_meeting(x + h_spd, y + v_spd + sign(v_check), obj_solid)) {
			v_check = 0;
		} else {
			v_spd += sign(v_check);
			v_check -= sign(v_check);
		}
	}
}

//Movement
x += h_spd;
y += v_spd;
