switch (state)
{
case PlayerState.FREE: PlayerStateFree(); break;
case PlayerState.FREEZE: PlayerStateFreeze(); break;
}

if keyboard_check_pressed(ord("G"))
{
state = PlayerState.FREEZE
}