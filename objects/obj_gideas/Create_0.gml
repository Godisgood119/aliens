// BASIC
hp = 800;
move = 0;
move_level = 1;

// MOVEMENT
x = room_width/2;
y = -sprite_height;
target_x = 0;
target_y = room_height/2;
move_x = 0;
move_y = 0;
xx = x;
yy = y;

hover = hovers.none;
hsize = 16;
hvar = 0;

// BODY
left_arm = instance_create_layer(x, y, "Instances", obj_gideas_arm);
right_arm = instance_create_layer(x, y, "Instances", obj_gideas_arm);
right_arm.image_xscale = -1;