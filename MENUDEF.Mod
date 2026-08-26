
OptionValue LocationOptions 
{
	0, "$FPP_HELM"
	1, "$FPP_RSHO"
	2, "$FPP_LSHO"
	3, "$FPP_CENT"
	4, "$FPP_GUN"
	5, "$FPP_CUSTPOS"
}

OptionValue SwayOptions 
{
	0, "$FPP_NOSWAY"
	1, "$FPP_SPRINGY"
	2, "$FPP_STIFF"
	3, "$FPP_SWAYCUSTOM"
}

OptionValue FlashlightSoundOptions 
{
	0, "$FPP_DEFCLICK"
	1, "$FPP_OLDCLICK"
	2, "$FPP_ALTCLICK"
	3, "$FPP_FUUUTURE"
	4, "$FPP_HL1TOGGLE"
	5, "$FPP_DDZTOGGLE"
	6, "$FPP_OP4NVSND"
	7, "$FPP_PREYFLME"
	8, "$FPP_FUUTURE2"
	9, "$FPP_LITFRONG"
	10, "$FPP_BDV21SOUND"
}

OptionMenu "FlashlightPlusOptions" 
{
	Title "$FPP_TITL"

	StaticText ""
    
    Submenu "$FPP_PRST","FlashlightPlusPresets"

	StaticText ""
    
    Control "$FPP_TGLE","FPP_Toggle"
   
    StaticText ""
	
	ColorPicker "$FPP_CLR", "cl_flashlight_plus_color"
	
	StaticText ""
    
    Option "$FPP_PLAYCLIK", "cl_flashlight_plus_plus_playsound", "OnOff"
    Option "$FPP_SNDCHOICE", "cl_flashlight_plus_plus_sound", "FlashlightSoundOptions", "cl_flashlight_plus_plus_playsound"

	StaticText ""
	
	Slider "$FPP_RNGE", "cl_flashlight_plus_intensity", 0, 1024, 1, 0

	StaticText ""

	Slider "$FPP_IANG", "cl_flashlight_plus_inner", 0, 180, 1, 0
	Slider "$FPP_OANG", "cl_flashlight_plus_outer", 0, 180, 1, 0

	StaticText ""

	Option "$FPP_SECBEM", "cl_flashlight_plus_second_beam", "OnOff"

	StaticText ""

	Slider "$FPP_SCBMUL", "cl_flashlight_plus_color_2_mult", 0, 5, 0.05, 2, "cl_flashlight_plus_second_beam"

	StaticText ""

	Slider "$FPP_SCRNGE", "cl_flashlight_plus_intensity_2", 0, 1024, 1, 0, "cl_flashlight_plus_second_beam"

	StaticText ""

	Slider "$FPP_IAN2", "cl_flashlight_plus_inner_2", 0, 180, 1, 0, "cl_flashlight_plus_second_beam"
	Slider "$FPP_OAN2", "cl_flashlight_plus_outer_2", 0, 180, 1, 0, "cl_flashlight_plus_second_beam"

	StaticText ""

    Option "$FPP_ALERT", "cl_flashlight_plus_plus_alertmonsters", "YesNo"
	
	StaticText ""
	
	Option "$FPP_POS", "cl_flashlight_plus_location", "LocationOptions"
	Submenu "$FPP_TWEAKPOS", "TweakPosition"
	
	StaticText ""
	
	Option "$FPP_SWAY", "cl_flashlight_plus_plus_sway_type", "SwayOptions"
	Submenu "$FPP_TWEAKSWAY", "TweakSway"
	
	StaticText ""

	SafeCommand "$FPP_UINS","netevent flashlight_plus_uninstall", "$FPP_YUSURE2"
	StaticText "$FPP_WARN","DarkRed"
	StaticText ""
	
	Submenu "$FPP_ADVANCED", "AdvancedFlashlightSettings"
}

AddOptionMenu "OptionsMenu"
{
	Submenu "$FPP_TITOP", "FlashlightPlusOptions"
	StaticText ""
}

AddOptionMenu "OptionsMenuSimple"
{
	Submenu "$FPP_TITOP", "FlashlightPlusOptions"
    StaticText ""
}

//AddOptionMenu "CustomizeControls"
//{
    //I have no idea if this is the proper way to do this
  
    //it wasn't 
   
    //StaticText ""
    //StaticText "Flashlight Binds", "Gold"
    //Control "$FPP_TGLE","netevent flashlight_plus_toggle"
//}

OptionMenu "FlashlightPlusPresets" {
	Title "Flashlight Presets"
	
    SafeCommand "$FPP_DEFA", "cl_flashlight_defaultpreset", "$FPP_YOUSURE"
	
	StaticText ""
	
	SafeCommand "$FPP_OLDDEFAULT", "cl_flashlight_olddefaultpreset", "$FPP_YOUSURE"
	
	StaticText ""
	
	SafeCommand "Half-Life 2", "cl_flashlight_hl2preset", "$FPP_YOUSURE"

    StaticText ""

    SafeCommand "Doom 3 BFG Edition", "cl_flashlight_d3preset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_GRNMGK", "cl_flashlight_magicpreset", "$FPP_YOUSURE"
    SafeCommand "$FPP_BLUMGK", "cl_flashlight_magicbluepreset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_LAMP", "cl_flashlight_lamppreset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_HDLI", "cl_flashlight_minerpreset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_FULL", "cl_flashlight_fullbrightpreset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_GENE", "cl_flashlight_basicpreset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_HARD", "cl_flashlight_hardpreset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_METADOOM", "cl_flashlight_metadoompreset", "$FPP_YOUSURE"
    
    StaticText ""
    
    SafeCommand "$FPP_OP4NVG", "cl_flashlight_op4nvgpreset", "$FPP_YOUSURE"
}

optionmenu TweakSway
{
	Title "$FPP_TWEAKSWAY"
	
	Slider "$FPP_SPRING", "cl_flashlight_plus_plus_sway_spring", 0.1, 1.0, 0.01, 2
	StaticText "$FPP_SPRINGDESC"
	statictext ""
	
	Slider "$FPP_DAMPING", "cl_flashlight_plus_plus_sway_damping", 0.1, 1.0, 0.01, 2
	StaticText "$FPP_DAMPINGDESC"
	statictext ""
	
	Slider "$FPP_INERTIA", "cl_flashlight_plus_plus_sway_inertia", -10, 10, 1, 0
	StaticText "$FPP_INERTIADESC"
}

OptionMenu TweakPosition
{
	Title "$FPP_TWEAKPOS"
	
	Slider "$FPP_XPOS", "cl_flashlight_plus_plus_custpos_x", -32, 32, 1
	StaticText "$FPP_XDESC"
	statictext ""
	
	Slider "$FPP_YPOS", "cl_flashlight_plus_plus_custpos_y", -32, 32, 1
	StaticText "$FPP_YDESC"
	statictext ""
	
	Slider "$FPP_ZPOS", "cl_flashlight_plus_plus_custpos_z", -32, 32, 1
	StaticText "$FPP_ZDESC"
}

optionmenu AdvancedFlashlightSettings
{
	Title "$FPP_ADVANCED"
	
	Option "$FPP_ATTENUATED", "cl_flashlight_plus_plus_attenuated", "YesNo"
	StaticText "$FPP_ATTENUATED_DESC"
	StaticText ""
	Option "$FPP_NOISE", "cl_flashlight_plus_plus_noise", "YesNo"
	StaticText "$FPP_NOISE_DESC"
	slider "$FPP_NOISE_MIN", "cl_flashlight_plus_plus_noise_min", 0.5, 0.99, 0.01, 2
	StaticText "$FPP_NOISE_WARNING"
}

AddOptionMenu "OptionsMenuSimple"
{
	StaticText " "
	Submenu "$SMPBOptions", "SMPBOptions"
}

AddOptionMenu "OptionsMenu"
{
	StaticText " "
	Submenu "$SMPBOptions", "SMPBOptions"
}

OptionMenu "SMPBOptions"
{
	Title "$SMPBOptions"
	Option "$SMPBEnabled", "smpb_enable", "YesNo"
	StaticText " "
	StaticText "$SMPBTicRateInfo"
	Slider "$SMPBTicRate", "smpb_tics", 3, 15, 1
	StaticText " "
	StaticText "$SMPBRangeInfo"
	Slider "$SMPBRange", "smpb_range", 1500, 5000, 250
	StaticText " "
	Option "$SMPBDistAggro", "smpb_distmoreaggro", "YesNo"
}

OptionValue "WeatherPrecipitationAmount"
{
	0, "Off"
	1, "Low"
	2, "Medium"
	3, "High"
	4, "Very High"
}

OptionValue "WeatherType"
{
	0, "Sunny"
	1, "Rain"
	2, "Snow"
	3, "Blood Rain"
	4, "Ash"
}

OptionValue "WeatherIntensity"
{
	0, "Light"
	1, "Moderate"
	2, "Heavy"
}

AddOptionMenu "OptionsMenu"
{
	Submenu "Weather Options", "WeatherOptions"
}

OptionMenu "WeatherOptions"
{
	Title "Weather Options"
	
	StaticText "Rain and Snow Controls", Gold
	StaticText ""
	
	Option "Weather Type", "rs_weather", "WeatherType"
	Option "Weather Intensity", "rs_intensity", "WeatherIntensity"
	StaticText ""
	
	Control "Next Weather", "NextWeather"
	Control "Previous Weather", "PrevWeather"
	Control "Next Intensity", "NextIntensity"
	Control "Previous Intensity", "PrevIntensity"
	StaticText ""
	
	StaticText "Weather Settings", Gold
	StaticText ""
	
	Option "Precipitation Amount", "weather_amount", "WeatherPrecipitationAmount"
	StaticText ""
	
	Slider "Precipitation Volume", "weather_precip_vol", 0, 1, 0.05, 2
	Slider "Wind Volume", "weather_wind_vol", 0, 1, 0.05, 2
	Slider "Thunder Volume", "weather_thunder_vol", 0, 1, 0.05, 2
	StaticText ""
	
	Option "Disable Lightning", "weather_no_lightning", "OnOff"
	Option "Disable Fog", "weather_no_fog", "OnOff"
}


AddOptionMenu "OptionsMenu"
{
	StaticText ""
	Submenu "MEGANOIA", "ZMoveOptions"
}

OptionMenu "ZMoveOptions"
{
	Class "ZMoveMenu"
	Title "MEGA NOIA"
	
	StaticText	"Speed & Acceleration", 1
	ZMoveOption	"Movement Type",						"Pick your Movement Type",																"zm_movetype",				"MoveType"
	ZMoveSlider "Ground Friction Strength", 			"Set ground friction strength",															"zm_friction",				0.5,	10.0,	0.1
	ZMoveSlider	"Maximum Ground Speed",					"Maximum ground speed (u/s)",															"zm_maxgroundspeed",		10,		15,		0.1
	ZMoveSlider "Maximum Hopping Speed", 				"Maximum hopping speed (u/s)",															"zm_maxhopspeed",			24,		36,		1,		0
	ZMoveSlider	"Walk Speed",							"How fast you move when walking",														"zm_walkspeed",				0.5,	1.0,	0.1
	ZMoveSlider	"Crouch Speed",							"How fast you move when crouching",														"zm_crouchspeed",			0.1,	1.0,	0.1
	ZMoveSlider "StrafeRunning Speed Bonus",			"Ground straferunning speed boost",														"zm_strafemodifier",		1.0,	1.5,	0.05,	2
	ZMoveOption	"Quake Wall Friction",					"Prevents player from slowing down when touching walls",								"zm_wallfriction",			"OnOff"
	ZMoveOption	"Drop Prevention",						"Helps not fall off ledges when you are walking",										"zm_dropprevention",		"OnOff"
	StaticText	""
	StaticText	"Dusk Movement", Orange
	ZMoveSlider "Strafejumping Acceleration", 			"How fast you gain speed when you strafejump",											"dsk_acceleration",			1.0,	2.5,	0.1
	StaticText	""
	StaticText	"Painkiller Movement", Orange
	ZMoveSlider "BHop Acceleration", 					"How fast you gain speed when bunnyhopping",											"pk_acceleration",			1.0,	2.0,	0.05,	2
	StaticText	""
	StaticText	"Quake Movement", Orange
	ZMoveOption	"Strafe Jumping Type",					"Pick your strafe jumping type",														"q_strafetype",				"StrafeType"
	ZMoveSlider "Q3 Acceleration", 						"How fast you gain speed when strafejumping Q3 style",									"q_3airaccel",				0.5,	1.0,	0.05,	2
	ZMoveSlider "Q1 Acceleration", 						"How fast you gain speed when strafejumping Q1 style",									"q_1airaccel",				1.0,	2.0,	0.05,	2
	StaticText	""
	
	StaticText	"Jumping", 1
	ZMoveSlider "Jump Height", 							"Player jump height",																	"zm_jumpheight",			5,		8,		0.5
	ZMoveSlider "Gravity", 								"Set player gravity",																	"zm_setgravity",			0.1,	1.5,	0.1,	2
	ZMoveOption "Auto Jump", 							"Enable auto jump",																		"zm_autojump",				"OnOff"
	StaticText	""
	StaticText	"Build Engine Movement", Orange
	ZMoveSlider "Jump Animation ViewHeight", 			"How much your viewpoint lowers when executing a jump",									"be_jumpanim",				4.0,	8.0,	0.5
	StaticText	""
	StaticText	"Painkiller Movement", Orange
	ZMoveSlider "BHop Jump Height", 					"Bunny hop jump height (% of regular jump height)",										"pk_bhopjumpheight",		0.5,	1,		0.1,	2
	StaticText	""
	StaticText	"Double Jump", Orange
	ZMoveOption "Double Jump Type", 					"Enable and choose Double Jumping style",												"zm_doublejump",			"DoubleJump"
	ZMoveSlider "Double Jump Height", 					"Double jump height (% of regular jump height)",										"zm_doublejumpheight",		0.5,	1.5,	0.1
	ZMoveOption "Wall Jump Renewal", 					"Grants double jump everytime you execute a consecutive wall jump",						"zm_wjdoublejumprenew",		"OnOff"
	StaticText	""
	StaticText	"Ramp Jumps", Orange
	ZMoveSlider "Ramp Jump Multiplier", 				"How beneficial a ramp jump is to the overall jump height",								"zm_rjumpmulti",			0.5,	1.2,	0.1,	2
	StaticText	""
	StaticText	"Elevator Jumps", Orange
	ZMoveOption "Elevator Jumps Enabled", 				"When on you can perform UT style elevator jumps",										"zm_elevatorjump",			"OnOff"
	ZMoveSlider "Elevator Jumps Bonus Multiplier", 		"Multiplier of the elevator jump bonus",												"zm_ejumpmultiplier",		1.0,	2.0,	0.05,	2
	StaticText	""
	StaticText	"Jump landing height animation", Orange
	ZMoveOption	"Jump Landing Enabled",					"Enable Build style jump landing view height animation",								"zm_landing",				"OnOff"
	ZMoveSlider	"Landing Velocity Sensitivity",			"How sensitive the height change is to the landing velocity",							"zm_landingsens",			4.0,	8.0,	0.1
	ZMoveSlider	"Animation Speed",						"How quickly your viewheight returns to normal",										"zm_landingspeed",			0.25,	1.0,	0.05,	2
	ZMoveSlider	"Minimum Height",						"The minimum viewheight you reach during a landing",									"zm_minlanding",			0.5,	0.75,	0.05,	2
	StaticText	""
	
	StaticText	"Dashing", 1
	Control		"Dash - Wall Jump Bind",				"Dash"
	ZMoveOption	"Dash Enabled",							"Enable dashing",																		"zm_dash",					"OnOff"
	ZMoveOption	"Double Tap Dash",						"Enable dashing double tapping trigger",												"zm_doubletap",				"OnOff"
	ZMoveSlider "Max Double Tap Time", 					"Maximum double tapping time",															"zm_maxtaptime",			2,		20,		1,		0
	ZMoveSlider "Dash Boost", 							"Set how fast you dash",																"zm_dashboost",				1.2,	1.5,	0.05,	2
	ZMoveSlider "Dash Jump Height", 					"Set how high you jump when dashing",													"zm_dashheight",			0.5,	1.0,	0.05,	2
	StaticText	""
	StaticText	"Wall Jumping", Orange
	ZMoveOption	"Wall Jump Enabled",					"Enable wall jumping",																	"zm_wjump",					"OnOff"
	ZMoveSlider "Wall Jump Boost", 						"Set how fast you walljump",															"zm_wjumpboost",			1.5,	2.0,	0.05,	2
	ZMoveSlider "Consecutive Jumps Bonus", 				"Speed bonus per each consecutive wall jump",											"zm_multipledashes",		0.0,	2.0,	0.05,	2
	ZMoveSlider "Wall Jump Height", 					"Set how high you jump when wall jumping",												"zm_wjumpheight",			0.5,	1.0,	0.05,	2
	StaticText	""
	StaticText	"Air Dashing", Orange
	ZMoveOption	"Air Dash Enabled",						"Enable air dashing",																	"zm_airdash",				"OnOff"
	ZMoveSlider	"Air Dash Boost",						"How strong air dashing boost is",														"zm_adashboost",			5,		15,		1,		0
	ZMoveSlider	"Air Dash Friction",					"How quickly you will loose speed after an air dash",									"zm_adashfriction",			0.5,	1.5,	0.05,	2
	StaticText	""
	
	StaticText	"Wall Sliding", 1
	Control		"Wall Slide Bind",						"WallSlide"
	ZMoveOption	"Wall Slide Enabled",					"Enable wall sliding",																	"zm_wslide",				"OnOff"
	ZMoveSlider "Wall Sliding Gravity", 				"How strong gravity is when wall sliding",												"zm_wslidevelz",			0.5,	1.0,	0.05,	2
	StaticText	""
	
	StaticText	"CrouchSlide", 1
	ZMoveOption "Crouch Slide", 						"Choose crouchslide type",																"zm_crouchslide",			"SlideType"
	StaticText	""
	StaticText	"Regular Crouch Slide", Orange
	ZMoveSlider "Slide Speed Boost", 					"Set the initial crouch slide speed boost",												"zm_cslidestrength",		1.5,	2.5,	0.05,	2
	ZMoveSlider "Slide duration", 						"Maximum slide duration in tics",														"zm_cslideduration",		10,		15,		1,		0
	StaticText	""
	StaticText	"Quake Crouch Slide", Orange
	ZMoveSlider "Slide Acceleration", 					"How strong the crouch slide acceleration is",											"zm_qslideaccel",			5.0,	7.0,	0.05,	2
	ZMoveSlider "Slide duration", 						"Multiplier of the crouch slide duration",												"zm_qslideduration",		6,		10,		1,		0
	StaticText	""
	
	StaticText	"Ledge Grabbing", 1
	ZMoveOption "Ledge Grabbing Enabled", 				"Turn on and off ledge grabbing",														"zm_ledgegrab",				"OnOff"
	StaticText	""
	
	StaticText	"Grappling Hook", 1
	Control		"Grappling Hook Bind",					"GrapplingHook"
	ZMoveOption "Grappling Hook Enabled", 				"Enable and choose grappling hook style",												"zm_hook",					"GHook"
	ZMoveSlider "Hook speed boost", 					"Intensity of the hook's speed boost",													"zm_hookboost",				1.0,	2.0,	0.1
	StaticText	""
	
	StaticText	"Bobbing", 1
	ZMoveSlider	"Walk/Run View Bobbing",				"Adjust view bobbing's intensity when moving",											"movebob",					0.0,	1.0,	0.1
	ZMoveSlider	"Still View Bobbing",					"Adjust view bobbing's intensity when not moving",										"stillbob",					0.0,	1.0,	0.1
	ZMoveSlider	"Walk/Run Weapon Bobbing",				"Adjust weapon bobbing's intensity when moving",										"wbobspeed",				0.0,	2.0,	0.1
	ZMoveOption	"Still Weapon Bobbing",					"Turn on/off the weapon bobbing when standing still",									"zm_stillbob",				"OnOff"
	StaticText 	""
	StaticText	"Weapon Sway", Orange
	ZMoveOption "Yaw Weapon Sway", 						"Allow weapons to sway according to your mouse yaw",									"zm_sway",					"OnOff"
	ZMoveSlider "Sway Speed", 							"How fast weapons sway",																"zm_swayspeed",				0,		4,		0.5
	ZMoveSlider "Sway Range", 							"Maximum distance weapons can sway",													"zm_swayrange",				0,		50,		1,		0
	ZMoveOption "Sway Direction", 						"Set wherever weapons sway in the direction you turn or the opposite",					"zm_swaydirection",			"SwayDirection"
	StaticText 	""
	StaticText	"Vertical Offset", Orange
	ZMoveOption "Vertical Weapon Offset", 				"Allow weapons to offset vertically while in the air",									"zm_offset",				"OnOff"
	ZMoveSlider "Offset Speed", 						"How fast weapons raise and fall depending on your vertical velocity",					"zm_offsetspeed",			0,		4,		0.5
	ZMoveSlider "Offset Range", 						"Maximum height weapons can fall",														"zm_offsetrange",			0,		50,		1,		0
	ZMoveOption "Offset Direction", 					"Set wherever the sprites are offset according to your vertical direction",				"zm_offsetdirection",		"OffsetDirection"
	StaticText 	""
	
	StaticText	"Others", 1
	ZMoveOption "Speedometer", 							"Enable speedOMeter",																	"zm_speedometer",			"Speedometer"
	Control		"Reset to default values",				"zmove_reset"
}

OptionValue "MoveType"
{
	0, "Doom"
	1, "Build Engine"
	2, "Dusk"
	3, "Painkiller"
	4, "Quake"
	5, "Unreal Tournament"
}

OptionValue "StrafeType"
{
	0, "Quake 3"
	1, "Quake 1"
	2, "CPMA"
}

OptionValue "DoubleJump"
{
	0, "Off"
	1, "Unreal Tournament"
	2, "Doom 4"
}

OptionValue "SlideType"
{
	0, "Off"
	1, "Regular"
	2, "Quake"
}

OptionValue "BobType"
{
	0, "Doom"
	1, "Build Engine"
	2, "Dusk"
	3, "Painkiller"
	4, "Unreal Tournament"
}

OptionValue "GHook"
{
	0, "Off"
	1, "Pull Only"
	2, "Pull & Pendulum"
}

OptionValue "SwayDirection"
{
	0, "Opposite Direction"
	1, "Same Direction"
}

OptionValue "OffsetDirection"
{
	0, "Opposite Direction"
	1, "Same Direction"
}

OptionValue "Speedometer"
{
	0, "Off"
	1, "Doom Units"
	2, "Quake Units"
}