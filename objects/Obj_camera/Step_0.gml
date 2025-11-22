if (instance_exists(target)) {
    var xx = target.x - width * 0.5;
    var yy = target.y - height * 0.5;

    camera_set_view_pos(cam, xx, yy);
}
