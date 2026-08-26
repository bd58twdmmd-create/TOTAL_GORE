version "4.10.0"

//#include "zscript/MOToolTip.zs"
#include "zscript/actors/GrezzoPlayer.zs"
#include "zscript/actors/GrezzoActor.zs"
#include "zscript/actors/GrezzoWeapon.zs"
#include "zscript/actors/GrezzoVehicle.zs"
#include "zscript/actors/GrezzoHealth.zs"

#include "zscript/DrogaEAlcol.zs"
#include "zscript/actors/scienziati/alice.zs"

#include "zscript/livelli/Arena.zs"
#include "zscript/livelli/casatua.zs"
#include "zscript/livelli/resetspeed.zs"
#include "zscript/livelli/spazio.zs"
#include "zscript/livelli/stelle.zs"
#include "zscript/livelli/HideHud.zs"
#include "zscript/livelli/Ospedale.zs"

#include "zscript/ui/FullScreenImage.zs"
#include "zscript/ui/GrezzoStatusBar.zs"
#include "zscript/ui/HintMessage.zs"
#include "zscript/cutscenes.zs"

#include "zscript/core/CullingManager.zs"
#include "zscript/core/DualWielding.zs"
#include "zscript/core/WeaponWheel.zs"
#include "zscript/core/SMPB.zs"

#include "zscript/UseToPickup/INIFile.zc"
#include "zscript/U2P_Gutamatics/Include.zsc"

#include "zscript/UseToPickup/UseToPickup.zc"
#include "zscript/UseToPickup/ActorClassInfo.zc"
#include "zscript/UseToPickup/DrawContext.zc"
#include "zscript/UseToPickup/ItemReachabilityTracer.zc"
#include "zscript/UseToPickup/PlayerSettings.zc"
#include "zscript/UseToPickup/PlayerState.zc"
#include "zscript/UseToPickup/ActorAdjustedGeometry.zc"
#include "zscript/UseToPickup/ItemHighlight.zc"

#include "zscript/actors/armi/1911.zs"
#include "zscript/actors/armi/tennents.zs"
#include "zscript/actors/armi/saccagnata.zs"
#include "zscript/actors/armi/katana.zs"
#include "zscript/actors/armi/machete.zs"
#include "zscript/actors/armi/yeeelauncher.zs"
#include "zscript/actors/armi/pera.zs"

//PROPS
#include "zscript/actors/props/quadri.zs"
#include "zscript/actors/props/bandiere.zs"
#include "zscript/actors/props/posters.zs"
#include "zscript/actors/props/uovo.zs"
#include "zscript/actors/props/notizie.zs"
#include "zscript/actors/props/barile.zs"

#include "zscript/actors/effetti/fire.zs"
#include "zscript/actors/effetti/smoke.zs"
#include "zscript/actors/effetti/explosions.zs"
#include "zscript/actors/effetti/projectiles.zs"

// DESCENT RISISTEMARE

const DMGTAKEN     = 0.20; // Damage received multiplier.
const DSCDMG       = 2.15; // Damage dealt muiltiplier
const DSCMAXAMMO   = 4.00; // Max Ammo Scale
const DSCMOVESPEED = 1.20; // Move Speed
const DSCMOVEFRICT = 1.60; // Movement Friction

// Full Credit to: dodopod ( https://gitlab.com/dodopod/6dof-player )
#include "zscript/6dof/quaternion.zs"
#include "zscript/6dof/ctrls_handler.zs"
#include "zscript/6dof/six_dof_player.zs"

// Descent
#include "zscript/descent/descent_math.zs"
#include "zscript/descent/descent_player.zs"
#include "zscript/descent/descent_generics.zs"

// SBS
#include "zscript/descent/SBS/dsc_sbs_base.zsc"
#include "zscript/descent/SBS/dsc_sbs_3D.zsc"

#include "zscript/shaders/VHSShaderHandler.zs"
#include "zscript/shaders/RetroHandler.zs"
#include "zscript/shaders/WaterHandler.zs"

#include "zscript/torcia/FPP_Holder.zs"
#include "zscript/torcia/FPP_Handler.zs"
#include "zscript/torcia/FPP_Light.zs"

// Core
#include "zscript/weather/weatherhandler.zs"
#include "zscript/weather/weather.zs"
#include "zscript/weather/precipitation.zs"

// Rain and Snow
#include "zscript/weather/rainandsnow.zs"

#include "zscript/ZMoveMenu.zs"
