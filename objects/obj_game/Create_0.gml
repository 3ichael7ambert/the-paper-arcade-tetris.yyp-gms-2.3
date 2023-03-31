score=0;
drag_start_x = 0;
drag_start_y = 0;
dragging = false;
/*


                   TETRIS

        Remade in Game Maker by Davve
         http://www.stuffbydavid.com

        Feel free to edit or whatever

*/

//      We'll start with creating the play field as a two dimensional array, where the first
//      index is the row, and the second index is the column. We want it to be 10 x 20 cells.
//      A value in the array is the ID of the block in that cell (-1 if it is empty).

var a, b;
for (a = 1; a <  21; a += 1)
{
    game_line[a] = 0;                   //Each row have a game_line value, which is used to determine if that row is "completed".
    for (b = 1; b < 11; b += 1)
    {
        game_field[a, b] = -1;
    }
}

//      We are now creating the different pieces to be used in the game. We identify them by
//      their ID (between 0 and 6) and their rotation (between 0 and 3). Again, as a two
//      dimensional array holding strings which represent the location of the four blocks.

//I piece

game_piece[0, 0] = "0100-0100-0100-0100";
game_piece[0, 1] = "0000-1111-0000-0000";
game_piece[0, 2] = game_piece[0, 0];
game_piece[0, 3] = game_piece[0, 1];

//J piece

game_piece[1, 0] = "100-111-000";
game_piece[1, 1] = "011-010-010";
game_piece[1, 2] = "000-111-001";
game_piece[1, 3] = "010-010-110";

//L piece

game_piece[2, 0] = "001-111-000";
game_piece[2, 1] = "010-010-011";
game_piece[2, 2] = "000-111-100";
game_piece[2, 3] = "110-010-010";

//O piece

game_piece[3, 0] = "11-11";
game_piece[3, 1] = game_piece[3, 0];
game_piece[3, 2] = game_piece[3, 0];
game_piece[3, 3] = game_piece[3, 0];

//S piece

game_piece[4, 0] = "011-110-000";
game_piece[4, 1] = "010-011-001";
game_piece[4, 2] = game_piece[4, 0];
game_piece[4, 3] = game_piece[4, 1];

//T piece

game_piece[5, 0] = "010-111-000";
game_piece[5, 1] = "010-011-010";
game_piece[5, 2] = "000-111-010";
game_piece[5, 3] = "010-110-010";

//Z piece

game_piece[6, 0] = "110-011-000";
game_piece[6, 1] = "001-011-010";
game_piece[6, 2] = game_piece[6, 0];
game_piece[6, 3] = game_piece[6, 1];

//      Here's some variables that we are going to use in the game.

game_current_piece = -1;                    //The ID of the current piece.
game_current_piece_rotation = 0;            //The rotation of the current piece.
game_current_piece_x = 0;                   //The column of the current piece.
game_current_piece_y = 0;                   //The row of the current piece.
game_line_visible = 0;                      //If this variable is even, the completed rows will be visible. If odd, the completed rows will not be drawn.

game_level = 1;                             //The level (between 1 and 10). The higher level, the faster the pieces fall.
game_score = 0;                             //The score.
game_lines = 0;                             //Number of completed lines. The level is increased after four completed lines.


//      Here are the controls used in the game.

game_keymoveleft = vk_left;
game_keymoveright = vk_right;
game_keyrotate = vk_up;
game_keymovedown = vk_down;
game_keyhighscores = ord("H");

//      Set the look of the highscores.


//      Set the alarm to a value between 20 and 3 steps, depending on the level.

alarm[0] = max(3, 22 - (game_level * 2));

globalvar FONT;
FONT = font_add_sprite(spr_font, ord(" "), 0, -1);
draw_set_color(c_white); //We use white as it is the default blending color.
draw_set_font(FONT);
sound_volume(snd_muisc,.2);

/*ads_enable(308,0,0);

if ads_interstitial_available()
    {
    ads_interstitial_display();
    }
    
*/
/* */
action_sound(snd_muisc, 1);
/*  */
