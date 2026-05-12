#using scripts\shared\util_shared;

function onZombieKilled(victim, attacker)
{
    if(!isplayer(attacker))
        return;

    attacker.profile["kills"]++;

    attacker addXP(10);

    weap = attacker getCurrentWeapon();

    attacker addWeaponXP(weap, 5);
}

function onPlayerDeath(player)
{
    player.profile["deaths"]++;
}

function addWeaponXP(weapon, amount)
{
    if(!isDefined(self.profile["weaponxp"][weapon]))
    {
        self.profile["weaponxp"][weapon] = [];
        self.profile["weaponxp"][weapon]["level"] = 1;
        self.profile["weaponxp"][weapon]["xp"] = 0;
    }

    self.profile["weaponxp"][weapon]["xp"] += amount;

    needed = 100 + (self.profile["weaponxp"][weapon]["level"] * 25);

    while(self.profile["weaponxp"][weapon]["xp"] >= needed)
    {
        self.profile["weaponxp"][weapon]["xp"] -= needed;

        self.profile["weaponxp"][weapon]["level"]++;

        self iprintln("WEAPON LEVEL UP");
    }
}

function setLoadout(type)
{
    self.profile["loadout"] = type;
    self applyLoadout();
}

function applyLoadout()
{
    type = self.profile["loadout"];

    self.maxhealth = 100;
    self.speedMult = 1;
    self.damageMult = 1;

    if(type == "tank")
        self.maxhealth += 100;

    if(type == "speed")
        self.speedMult += 0.25;

    if(type == "assault")
        self.damageMult += 0.25;
}
