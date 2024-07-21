grav = 0.5
hsp = 0
vsp = 0
xscale = 1
yscale = 1
movespeed = 0
movespeedmax = 5
jumpstop = 0
start_running = 1
state = 0
turn = 0
jumpAnim = 1
dashAnim = 1
landAnim = 0
machslideAnim = 1
moveAnim = 1
stopAnim = 1
crouchslideAnim = 1
crouchAnim = 1
machhitAnim = 0
stompAnim = 0
inv_frames = 0
turning = 0
hurtbounce = 0
hurted = 0
mach2 = 0
input_buffer_jump = 8
player_x = x
player_y = y
targetRoom = disclaimer_room
flash = 0
global.key_inv = 0
global.shroomfollow = 0
global.cheesefollow = 0
global.tomatofollow = 0
global.sausagefollow = 0
global.pineapplefollow = 0
global.keyget = 0
global.collect = 0
global.ammo = 0
global.panic = 0
combo = 0
in_water = 0
key_particles = 0
barrel = 0
bounce = 0
a = 0
idle = 0
attacking = 0
slamming = 0
superslam = 0
machpunchAnim = 0
punch = 0
machfreefall = 0
shoot = 1
instakillmove = 0
windingAnim = 0
facestompAnim = 0
ladderbuffer = 0
toomuchalarm1 = 0
dashdust = 0
throwforce = 0
hurtsound = sfx_explosion
bombpephitwall = 0
idleanim = 0
momemtum = 0
depth = -10;

enum states
{
	normal, //0
	gottreasure, //1
	knightpep, //2
	knightpepattack, //3
	meteorpep, //4
	bombpep, //5
	grabbing, //6
	chainsawpogo, //7
	shotgunjump, //8
	stunned, //9
	highjump, //10
	chainsaw, //11
	facestomp, //12
	mach4, //13
	timesup,
	machroll,
	shotgun,
	pistol,
	machfreefall,
	player_throw,
	slam,
	superslam,
	skateboard,
	grind,
	grab,
	punch,
	backkick,
	uppunch,
	shoulder,
	backbreaker,
	bossdefeat,
	pizzathrow,
	bossintro,
	gameover,
	keyget,
	tackle,
	jump,
	ladder,
	slipnslide,
	comingoutdoor,
	smirk,
	Sjump,
	victory,
	Sjumpprep,
	crouch,
	crouchjump,
	crouchslide,
	mach1,
	mach2,
	machslide,
	bump,
	hurt,
	freefall,
	hang,
	unknown_54,
	freefallland,
	door,
	barrelcrouch,
	barrelfloat,
	barrelmach2,
	barrelmach1,
	barrelfall,
	barrelnormal,
	barrelslipnslide,
	barrelroll,
	current,
	boulder,
	runonball,
	mach3,
	freefallprep,
	Sjumpland,
	stairs
}
