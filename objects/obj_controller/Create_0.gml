pauseon=false
// pause screen variable

menu        =   virtual_key_add(291, 3,25,17, k_menu);
escape      =   virtual_key_add(291,27,25,17, k_quit);

//Simple Cardinal direction D-Pad, to add 8 dorections, duplicate the style bellow this.

vkright    =   virtual_key_add(262,130,28,28,k_right);
vkright    =   virtual_key_add(258,152,32,36,k_right);
vkright    =   virtual_key_add(262,182,28,28,k_right);

vkleft    =   virtual_key_add(212,130,28,28,k_left);
vkleft     =   virtual_key_add(210,152,32,36,k_left);
vkleft     =   virtual_key_add(210,182,28,28,k_left);

vkdown    =   virtual_key_add(212,182,28,28,k_down);
vkdown    =   virtual_key_add(232,178,36,32,k_down);
vkdown    =   virtual_key_add(262,182,28,28,k_down);

vkup    =   virtual_key_add(212,130,28,28,k_up);
vkup    =   virtual_key_add(232,130,36,32,k_up);
vkup    =   virtual_key_add(262,130,28,28,k_up);


// 8 touch points, with each corner having overlapping copies so that pressing in a diagonal to hit two buttons activates them both, allowing the closest feasable digital controls.
// Layout follows           1   2   3
//                          4       6
//                          7   8   9

