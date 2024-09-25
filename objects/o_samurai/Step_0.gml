image_speed=1;
switch(state)
{
	case "move":
		#region move state
if keyboard_check(ord("D"))
{
	moveandcollide(3,0);
	image_speed=1.4
	sprite_index = player1_RUN;
	image_xscale=1;

}
if keyboard_check(ord("A"))
{
	moveandcollide(-3,0);
	image_speed=1.4
	sprite_index = player1_RUN;
	image_xscale=-1;
	
}
if not keyboard_check(ord("A")) and not keyboard_check(ord("D"))
{
	sprite_index = s_IDLE;
	image_speed=1;
}

if keyboard_check(ord("J"))
{
	state="attackstate";
}

if keyboard_check_pressed(vk_shift)
{
	image_index=0;
	state="roll";

}
if keyboard_check_pressed(ord("K"))
{
	if candash=true
	{
		candash=false;
		
		state="dashattack";
	}
}
	#endregion
		break;

	case "roll":
		#region dash
	sprite_index=player1_DASH;
	if keyboard_check(ord("D")) 
	{
		moveandcollide(6,0);
		image_speed=2
	}
	if keyboard_check(ord("A"))
	{
		moveandcollide(-6,0);
		image_speed=2
	}
	#endregion
		break;
	
	case "dashattack":
		#region dashattack
	sprite_index=player1_DASH_ATTACK;
		if keyboard_check(ord("D")) and not place_meeting(x+9,y,o_wall)
	{
		image_speed=2;
		if (image_index>6)
		{
			x=x+9;
		}
	}
	if keyboard_check(ord("A")) and not place_meeting(x-9,y,o_wall)
	{
		image_speed=2;
		if(image_index>6)
		{
			x=x-9;
		}
	}
	#endregion
		break;
	case "attackstate":
		#region attack
			sprite_index = player1_ATTACK1;
			if image_index>1 and image_index<5
			{
				if keyboard_check(ord("D"))
				{
					moveandcollide(2,0);
				}
				if keyboard_check(ord("A"))
				{
					moveandcollide(-2,0);
				}
			}
			break;
		
		#endregion
}
	



	



