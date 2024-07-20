if ((!instance_exists(mycreator)) || mycreator.stun == 1 || mycreator.ministun == 1)
    instance_destroy()
else
    image_xscale = mycreator.image_xscale
