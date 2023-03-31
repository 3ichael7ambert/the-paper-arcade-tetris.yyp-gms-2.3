//      Set the window caption where the score and current level is shown.
score=game_score;
room_caption = "TETRIS - Score: " + string(game_score) + " - Level: "+ string(game_level);

//      In each step, we have to check if the player wants to move the current piece, using the controls
//      that were defined in the create event.

var a, free, move, str, xx, yy;

if (keyboard_check_pressed(game_keymoveleft) || keyboard_check_pressed(game_keymoveright) && game_current_piece  >-1)
{
    str = game_piece[game_current_piece, game_current_piece_rotation];
    move = keyboard_check_pressed(game_keymoveright) + (-1 * keyboard_check_pressed(game_keymoveleft))      //Move the piece left (-1) or right (1)?
    game_current_piece_x += move;
    xx = 0;
    yy = 0;
    for (a = 1; a < string_length(str) + 1; a += 1)                                     //Loop through the string of the current piece.
    {
        if (string_char_at(str, a) == "1")                                              //We have found a block!
        {
            if (game_current_piece_x + xx < 1 || game_current_piece_x + xx > 10)        //Check if the block is outside the field (less than 1 or larger than 10).
            {
                game_current_piece_x -= move;                   //Undo the move.
                break;
            }
            if (game_field[game_current_piece_y + yy, game_current_piece_x + xx] > -1)  //Check if there already is a block in the new cell.
            {
                game_current_piece_x -= move;                   //Undo the move.
                break;
            }
        }
        xx += 1;
        if (string_char_at(str, a) == "-")                      //Jump down if we encounter a '-'.
        {
            xx = 0;
            yy += 1;
        }
    }
}

//      We also need to check if the player wants to rotate the current piece.

if (keyboard_check_pressed(game_keyrotate) && game_current_piece > -1 && game_current_piece_y > 0)
{
    game_current_piece_rotation += 1;                                               //Add 1 to the rotation variable.
    game_current_piece_rotation = game_current_piece_rotation mod 4;                //If the rotation is larger than 3, it will automaticly jump down to 0.
    str = game_piece[game_current_piece, game_current_piece_rotation];
    xx = 0;
    yy = 0;
    free = 1;
    for (a = 1; a < string_length(str) + 1; a += 1)                                 //Loop through the string of the current piece.
    {
        if (string_char_at(str, a) == "1")                                          //We have found a block!
        {
            if (game_current_piece_x + xx < 1 || game_current_piece_x + xx > 10)    //Check if the block is outside the field (less than 1 or larger than 10).
            {
                free = 0;
                break;
            }
            if (game_current_piece_y + yy > 20)                                     //Check if the block is below the floor.
            {
                free = 0;
                break;
            }
            if (game_field[game_current_piece_y + yy, game_current_piece_x + xx] > -1)      //Check if there already is a block in the new cell.
            {
                free = 0;
                break;
            }
        }
        xx += 1;
        if (string_char_at(str, a) == "-")              //Jump down if we encounter a '-'.
        {
            yy += 1;
            xx = 0;
        }
    }
    if (free == 0)          //If the new space is taken, undo the rotation.
    {
        game_current_piece_rotation -= 1;
        if (game_current_piece_rotation < 0)
        {
            game_current_piece_rotation = 3;
        }
    }
}

//      Check if the player wants to move the piece down.

if (keyboard_check(game_keymovedown) && game_current_piece > -1 && alarm[0] > 1)
{
    alarm[0] = 1;
}

//      Check if the player wants to see the highscores.

if (keyboard_check_pressed(game_keyhighscores))
{
    //highscore_set_strings('Tetris highscores', '---', 'Press Enter or Escape to go back to the game!'); OBSOLETE
   // highscore_show(-1); OBSOLETE
}

