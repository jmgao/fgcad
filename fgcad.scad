module button(diameter, x = 0, y = 0, scale = 1.0) {
    translate([x * scale, y * scale]) {
        circle(diameter / 2, $fn = 100);
    }
}

// Spacing between buttons in the same row, not including button diameter
vewlix_horizontal_spacing = 6;

// Spacing between rows, not including button diameter
vewlix_vertical_spacing = 8.5;

// Vertical offset between rows
vewlix_row_offset_x = 7;

// Offset of the light buttons
vewlix_light_offset_x = 3;
vewlix_light_offset_y = -14;

// Vewlix button layout
module vewlix_buttons(
    button_nominal_diameter = 30,
    button_expansion = 0.1,
    horizontal_spacing = vewlix_horizontal_spacing,
    vertical_spacing = vewlix_vertical_spacing,
    row_offset_x = vewlix_row_offset_x,
    light_offset_x = vewlix_light_offset_x,
    light_offset_y = vewlix_light_offset_y,
) {
    diameter = button_nominal_diameter + button_expansion;
    x_spacing = horizontal_spacing + button_nominal_diameter;
    y_spacing = vertical_spacing + button_nominal_diameter;

    // LK
    button(diameter, -x_spacing + light_offset_x, light_offset_y);

    // MK
    button(diameter);

    // HK
    button(diameter, x_spacing, 0);

    // 3K
    button(diameter, x_spacing * 2, 0);

    // LP
    button(diameter, -x_spacing + light_offset_x + row_offset_x, light_offset_y + y_spacing);

    // MP
    button(diameter, row_offset_x, y_spacing);

    // HP
    button(diameter, row_offset_x + x_spacing, y_spacing);

    // 3P
    button(diameter, row_offset_x + x_spacing * 2, y_spacing);
}

module vewlix(
    stick_offset_x = 0,
    stick_offset_y = 0,
    center = true,
    button_nominal_diameter = 30,
    button_expansion = 0.1,
    horizontal_spacing = vewlix_horizontal_spacing,
    vertical_spacing = vewlix_vertical_spacing,
    row_offset_x = vewlix_row_offset_x,
    light_offset_x = vewlix_light_offset_x,
    light_offset_y = vewlix_light_offset_y,
) {
    stick_x = -128 + stick_offset_x;
    stick_y = stick_offset_y;

    x_space = horizontal_spacing + button_nominal_diameter;
    y_space = vertical_spacing + button_nominal_diameter;
    total_width = x_space * 2 + light_offset_x - stick_x;
    tx = center ? (-total_width / 2) - stick_x : 0;
    ty = 0;

    translate([tx, ty]) {
        button(24, -128, 0);
        vewlix_buttons(
            button_nominal_diameter = button_nominal_diameter,
            button_expansion = button_expansion,
            horizontal_spacing = horizontal_spacing,
            vertical_spacing = vertical_spacing,
            row_offset_x = row_offset_x,
            light_offset_x = light_offset_x,
            light_offset_y = light_offset_y
        );
    }
}