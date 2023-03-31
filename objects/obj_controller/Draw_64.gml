{
        if keyboard_check(k_up) draw_sprite(sp_u_button,0,234,130)
        else draw_sprite(sp_u_button,1,234,130)

        if keyboard_check(k_right) draw_sprite(sp_r_button,0,258,154)
        else draw_sprite(sp_r_button,1,258,154)

        if keyboard_check(k_down) draw_sprite(sp_d_button,0,234,178)
        else draw_sprite(sp_d_button,1,234,178)

        if keyboard_check(k_left) draw_sprite(sp_l_button,0,210,154)
        else draw_sprite(sp_l_button,1,210,154)
        
        draw_sprite(sp_menu,0,271,3)
        if pauseon==true draw_sprite(sp_exit,0,271,27)
}

