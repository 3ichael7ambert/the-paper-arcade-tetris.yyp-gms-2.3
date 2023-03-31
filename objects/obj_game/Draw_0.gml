//      The draw event will handle the drawing of the field and the current piece.

var a, b, str, xx, yy;

if (game_current_piece > -1)
{
    xx = 0;
    yy = 0;
    str = game_piece[game_current_piece, game_current_piece_rotation];
    for (a = 1; a < string_length(str) + 1; a += 1)                    //Loop through the string of the current piece.
    {
        if (string_char_at(str, a) == "1")                          //Draw a block if we encounter a '1'.
        {
            draw_sprite(spr_game, game_current_piece, (game_current_piece_x + xx) * 16, (game_current_piece_y + yy) * 16);
        }
        xx += 1;
        if (string_char_at(str, a) == "-")                          //Jump down if we encounter a '-'.
        {
            xx = 0;
            yy += 1;
        }
    }
}

for (a = 0; a < 22; a += 1)            //Loop through the field.
{
    for (b = 0; b < 12; b += 1)
    {
        if (b > 0 && b < 11 && a > 0 && a < 21)
        {
            if (game_field[a, b] > -1 && (game_line[a] == 0 || (game_line_visible mod 2) == 1))       //Draw a block if the row is not "completed".
            {
                draw_sprite(spr_game, game_field[a, b], b * 16, a * 16);
            }
        }
        else
        {
            draw_sprite(spr_game, 7, b * 16, a * 16);           //Draw the border.
        }
    }
}

action_draw_score(15, 360, "Score: ");
