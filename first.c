/* Copyright 2007 Openismus GmbH
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#include <clutter/clutter.h>
#include <stdlib.h>

ClutterText *label_angulo_atual;

struct RotationClosure {
	ClutterActor *actor;
	CoglFixed final_angle;
	CoglFixed current_angle;
};

static gboolean rotate_square(gpointer data)
{
	struct RotationClosure *clos = data;
	clutter_actor_set_rotation(clos->actor, CLUTTER_X_AXIS, clos->current_angle, 0, 0, 0);

	clos->current_angle += COGL_FIXED_1;
	//clutter_text_set_text(label_angulo_atual,"aiuahaui");

	if(clos->current_angle == clos->final_angle)
		return FALSE;

	return TRUE;
}

int main(int argc, char *argv[])
{
	ClutterColor stage_color = { 0x00, 0x00, 0x00, 0xff };
	ClutterColor actor_color = { 0xff, 0xff, 0xff, 0x99 };

	clutter_init (&argc, &argv);

	/* Get the stage and set its size and color: */
	ClutterActor *stage = clutter_stage_get_default ();
	clutter_actor_set_size (stage, 800, 600);
	clutter_stage_set_color (CLUTTER_STAGE (stage), &stage_color);

	ClutterActor *painel = clutter_group_new ();
	clutter_actor_set_position (painel, 400, 300);
	clutter_container_add_actor (CLUTTER_CONTAINER (stage), painel);
	clutter_actor_show (painel);
	
	ClutterActor *label = clutter_text_new_full ("Sans 12", "Olaaaaa Xorg!", &actor_color);
	clutter_actor_set_position (label, 20, 150);
	clutter_container_add_actor (CLUTTER_CONTAINER (painel), label);
	clutter_actor_show (label);

	//g_timeout_add(100, rotate_square, &painel);

	clutter_actor_show (stage);
	
	clutter_main ();

	return EXIT_SUCCESS;
}
