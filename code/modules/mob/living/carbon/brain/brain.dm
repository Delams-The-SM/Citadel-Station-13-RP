//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:32

/mob/living/carbon/brain
	var/obj/item/container = null
	var/timeofhostdeath = 0
	var/emp_damage = 0//Handles a type of MMI damage
	var/alert = null
	use_me = 0 //Can't use the me verb, it's a freaking immobile brain
	icon = 'icons/obj/surgery.dmi'
	icon_state = "brain1"
	no_vore = TRUE //VOREStation Edit - PLEASE. lol.

/mob/living/carbon/brain/Initialize()
	. = ..()
	var/datum/reagents/R = new/datum/reagents(1000)
	reagents = R
	R.my_atom = src

/mob/living/carbon/brain/Destroy()
	if(key)				//If there is a mob connected to this thing. Have to check key twice to avoid false death reporting.
		if(stat!=DEAD)	//If not dead.
			death(1)	//Brains can die again. AND THEY SHOULD AHA HA HA HA HA HA
		ghostize()		//Ghostize checks for key so nothing else is necessary.
	return ..()

/mob/living/carbon/brain/update_canmove()
	if(in_contents_of(/obj/mecha) || istype(loc, /obj/item/mmi))
		canmove = 1
		use_me = 1
	else
		canmove = 0
	return canmove

/mob/living/carbon/brain/isSynthetic()
	return istype(loc, /obj/item/mmi)

///mob/living/carbon/brain/binarycheck()//No binary without a binary communication device
//	return isSynthetic()
