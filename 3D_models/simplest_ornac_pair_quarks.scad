// model of ornac pairs in quarks
// made in openscad


single_ornac_sphere_radius = 1;
ornac_pair_outer_orbit_radius = 20;
ornac_pair_double_outer_orbit_radius = ornac_pair_outer_orbit_radius*1/2 ;
ornac_pair_outer_orbit_arrow_radius = 0.4;
ornac_pair_outer_orbit_lenght = 3;
ornac_pair_outer_orbit_arrow_number = 24;

$fn = 20;

// start single ornac pair
module ornac_pair_single ()
{
// center ornac
color("Blue",0.8) sphere(single_ornac_sphere_radius);


// ring of arrows
for (i = [1:ornac_pair_outer_orbit_arrow_number])
{

translate([ornac_pair_outer_orbit_radius*sin( i *360 /ornac_pair_outer_orbit_arrow_number), ornac_pair_outer_orbit_radius*cos( i *360 /ornac_pair_outer_orbit_arrow_number), 0])
rotate([i *360 /ornac_pair_outer_orbit_arrow_number, 90, 0])
color("Red", 0.3)
cylinder(ornac_pair_outer_orbit_lenght, ornac_pair_outer_orbit_arrow_radius, 0,center);
}

// ornac at ring

translate([ornac_pair_outer_orbit_radius, 0, 0])
rotate([0, 90, 0])
color("Red",0.5) sphere(single_ornac_sphere_radius);
}

// end single ornac pair





// start double ornac pair

module ornac_pair_double ()
{
// center ornac
translate([single_ornac_sphere_radius, 0, 0])color("Red", 0.8) sphere(single_ornac_sphere_radius);

translate([-single_ornac_sphere_radius, 0, 0])color("Red", 0.8) sphere(single_ornac_sphere_radius);


// ring of arrows
ornac_pair_outer_orbit_arrow_number = ornac_pair_outer_orbit_arrow_number/2;

for (i = [1:ornac_pair_outer_orbit_arrow_number])
{

translate([ornac_pair_double_outer_orbit_radius*sin( i *360 /ornac_pair_outer_orbit_arrow_number), ornac_pair_double_outer_orbit_radius*cos( i *360 /ornac_pair_outer_orbit_arrow_number), 0])

rotate([i *360 /ornac_pair_outer_orbit_arrow_number, 90, 0])
color("Blue",0.5)
cylinder(ornac_pair_outer_orbit_lenght, ornac_pair_outer_orbit_arrow_radius, 0,center);
}

// 2 ornac at ring

translate([ornac_pair_double_outer_orbit_radius, 0, 0])
rotate([0, 90, 0])
color("Blue",0.5) sphere(single_ornac_sphere_radius);


translate([-ornac_pair_double_outer_orbit_radius, 0, 0])
rotate([0, 90, 0])
color("Blue",0.5) sphere(single_ornac_sphere_radius);
}
// end double ornac pair



// create a stick of ornac pairs as a proton

for (i = [-1:1])
{
if (i == 0) {
translate([0, 0, ornac_pair_outer_orbit_radius/1.5*i])
ornac_pair_single () ;}

else {
translate([0, 0, ornac_pair_outer_orbit_radius/1.5*i])
ornac_pair_double ();}

}



