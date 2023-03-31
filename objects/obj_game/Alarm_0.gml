//      In this event, we first check if there are any completed rows to be deleted.

var a, b, c, d, lines, free, xx, yy, str;

if (game_line_visible > 0)
{
    game_line_visible += 1;
    alarm[0] = 7;
    if (game_line_visible > 4)          //Time to delete the completed rows! :D
    {
        game_line_visible = 0;
        lines = 0;
        for (a = 20; a > 1; a -= 1)             //Check the field for completed rows.
        {
            if (game_line[a] == 1)
            {
                game_lines += 1;
                lines += 1;
                for (b = a; b > 1; b -= 1)      //Loop through the field and move all the blocks down.
                {
                    for (c = 1; c < 11; c += 1)
                    {
                        game_field[b, c] = game_field[b - 1, c];
                        game_line[b] = game_line[b - 1];
                    }
                }
                a += 1;
            }
        }
        switch lines            //Add to the score, depending on the current level and how many rows the player completed.
        {
            case 1:
            {
                game_score += 40 * game_level;
                break;
            }
            case 2:
            {
                game_score += 100 * game_level;
                break;
            }
            case 3:
            {
                game_score += 300 * game_level;
                break;
            }
            case 4:
            {
                game_score += 1200 * game_level;
                break;
            }
        }
        if (game_lines > 3 && game_level < 10)      //Go to the next level, if the player have completed four or more lines.
        {
            game_lines = 0;
            game_level += 1;
        }
        alarm[0] = max(3, 22 - (game_level * 2));       //Set the alarm to a value between 20 and 3 steps, depending on the level.
    }
    exit;
}

//      If there is no piece in play, we create a new one.

if (game_current_piece == -1)
{
    game_current_piece = choose(0, 1, 2, 3, 4, 5, 6);
    game_current_piece_rotation = 0;
    game_current_piece_x = 5;
    game_current_piece_y = 0;
}

//      We now check if the current piece are about to collide with any blocks on the play field.

str = game_piece[game_current_piece, game_current_piece_rotation];
xx = 0;
yy = 0;
free = 1;
for (a = 1; a < string_length(str) + 1; a += 1)     //Loop through the string of the current piece.
{
    if (string_char_at(str, a) == "1")              //We have found a block!
    {
        if (game_current_piece_y + yy + 1 > 20)     //Check if that block have hit the floor.
        {
            free = 0;
            break;
        }
        if (game_field[game_current_piece_y + yy + 1, game_current_piece_x + xx] > -1)      //Check if there is another block below.
        {
            free = 0;
            break;
        }
    }
    xx += 1;
    if (string_char_at(str, a) == "-")          //Jump down if we encounter a '-'.
    {
        yy += 1;
        xx = 0;
    }
}
if (free == 1)              //Move the current piece down if the coast is clear!
{
    game_current_piece_y += 1;
}
else                        //If not...
{
    if (game_current_piece_y == 0)          //If the piece was just created, GAME OVER!
    {
       // highscore_set_strings('Tetris highscores', '---', 'Press Enter or Escape to try again!') OBSOLETE
       // highscore_show(game_score); OBSOLETE
        game_restart();
    }
    xx = 0;
    yy = 0;
    for (a = 1; a < string_length(str) + 1; a += 1)     //Loop through the string of the current piece and add each block to the field.
    {
        if (string_char_at(str, a) == "1")              //If we encounter a '1', add the block to the field.
        {
            game_field[game_current_piece_y + yy, game_current_piece_x + xx] = game_current_piece;
        }
        xx += 1;
        if (string_char_at(str, a) == "-")               //Jump down if we encounter a '-'.
        {
            yy += 1;
            xx = 0;
        }
    }
    game_current_piece = -1;
    d = 0;
    for (a = 1; a < 21; a += 1)         //Check for completed rows...
    {
        c = 0;
        for (b = 1; b < 11; b += 1)
        {
            if (game_field[a, b] > -1)
            {
                c += 1;
                d = 1;
            }
        }
        if (c == 10)                    //Row number a is completed!
        {
            game_line[a] = 1;
            game_line_visible = 1;
        }
    }
    if (d == 1)
    {
        alarm[0] = 10;
        exit;
    }
}

alarm[0] = max(3, 22 - (game_level * 2));       //Set the alarm to a value between 20 and 3 steps, depending on the level.



action_set_score(0);
