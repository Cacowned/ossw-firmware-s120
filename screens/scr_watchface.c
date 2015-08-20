#include <string.h>
#include "scr_watchface.h"
#include "../scr_mngr.h"
#include "../rtc.h"
#include "../mlcd.h"
#include "../scr_controls.h"
#include "../vibration.h"
#include "nrf_delay.h"
		
static NUMBER_CONTROL_DATA hour_ctrl_data;
		
static const SCR_CONTROL_NUMBER_CONFIG hour_config = {
		NUMBER_RANGE_0__99,
	  4,
	  4,
	  NUMBER_FORMAT_FLAG_ZERO_PADDED | 4 << 22 | 8 << 16 | 66 << 8 | 50,
	  (uint32_t (*)(uint32_t, uint8_t))rtc_get_current_hour,
	  0,
    &hour_ctrl_data
};

static NUMBER_CONTROL_DATA minutes_ctrl_data;

static const SCR_CONTROL_NUMBER_CONFIG minutes_config = {
		NUMBER_RANGE_0__99,
	  4,
	  59,
	  NUMBER_FORMAT_FLAG_ZERO_PADDED | 4 << 22 | 6 << 16 | 66 << 8 | 50,
	  (uint32_t (*)(uint32_t, uint8_t))rtc_get_current_minutes,
	  0,
    &minutes_ctrl_data
};

static NUMBER_CONTROL_DATA days_ctrl_data;
static const SCR_CONTROL_NUMBER_CONFIG days_config = {
	NUMBER_RANGE_0__99,
	4,
	115,
	NUMBER_FORMAT_FLAG_ZERO_PADDED | 4 << 22 | 4 << 16 | 32 << 8 | 48,
	(uint32_t (*)(uint32_t, uint8_t))rtc_get_current_day_of_month,
	0,
	&days_ctrl_data
};

static NUMBER_CONTROL_DATA months_ctrl_data;
static const SCR_CONTROL_NUMBER_CONFIG months_config = {
	NUMBER_RANGE_0__19,
	80,
	115,
	NUMBER_FORMAT_FLAG_ZERO_PADDED | 4 << 22 | 4 << 16 | 32 << 8 | 48,
	(uint32_t (*)(uint32_t, uint8_t))rtc_get_current_month,
	0,
	&months_ctrl_data
};


static NUMBER_CONTROL_DATA seconds_ctrl_data;

static const SCR_CONTROL_PROGRESS_BAR_CONFIG seconds_config = {
	  0,
	  MLCD_YRES - 3,
	  MLCD_XRES,
	  2,
	  60,
		0,
	  rtc_get_current_seconds,
	  0,
    &seconds_ctrl_data
};

static const SCR_CONTROL_DEFINITION controls[] = {
	  {SCR_CONTROL_NUMBER, (void*)&hour_config},
		{SCR_CONTROL_NUMBER, (void*)&minutes_config},
		{SCR_CONTROL_NUMBER, (void*)&days_config},
		{SCR_CONTROL_NUMBER, (void*)&months_config},
		{SCR_CONTROL_HORIZONTAL_PROGRESS_BAR, (void*)&seconds_config}
};

static const SCR_CONTROLS_DEFINITION controls_definition = {
	  sizeof(controls)/sizeof(SCR_CONTROL_DEFINITION),
	  (SCR_CONTROL_DEFINITION*)controls
};

static void scr_watchface_refresh_time() {
	  scr_controls_redraw(&controls_definition);
}

static void scr_watchface_handle_button_pressed(uint32_t button_id) {
    switch (button_id) {
        case SCR_EVENT_PARAM_BUTTON_UP:
            scr_mngr_show_screen(SCR_WATCH_SET);
            break;
    }
}

static void scr_watchface_handle_button_long_pressed(uint32_t button_id) {
    switch (button_id) {
        case SCR_EVENT_PARAM_BUTTON_SELECT:
            scr_mngr_show_screen(SCR_SETTINGS);
            break;
    }
}

static void scr_watchface_draw() {
	  scr_controls_draw(&controls_definition);
}

void scr_watchface_handle_event(uint32_t event_type, uint32_t event_param) {
    switch(event_type) {
        case SCR_EVENT_DRAW_SCREEN:
            scr_watchface_draw();
            break;
        case SCR_EVENT_REFRESH_SCREEN:
            scr_watchface_refresh_time();
            break;
        case SCR_EVENT_BUTTON_PRESSED:
            scr_watchface_handle_button_pressed(event_param);
            break;
        case SCR_EVENT_BUTTON_LONG_PRESSED:
            scr_watchface_handle_button_long_pressed(event_param);
            break;
    }
}
