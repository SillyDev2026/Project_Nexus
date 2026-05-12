#using scripts\shared\util_shared;

function addXP(amount)
{
    mult = 1 + (self.profile["skills"]["xp"] * 0.1);
    amount = int(amount * mult);

    self.profile["xp"] += amount;

    needed = getXPNeeded();

    while(self.profile["xp"] >= needed)
    {
        self.profile["xp"] -= needed;

        self.profile["level"]++;
        self.profile["tokens"]++;

        self iprintln("^2LEVEL UP!");

        needed = getXPNeeded();
    }
}

function getXPNeeded()
{
    return 100 + (self.profile["level"] * 50);
}

function prestige()
{
    if(self.profile["level"] < 75)
        return;

    self.profile["prestige"]++;
    self.profile["level"] = 1;
    self.profile["xp"] = 0;

    self iprintln("^5PRESTIGE!");
}

function upgradeSkill(skill)
{
    cost = self.profile["skills"][skill] + 1;

    if(self.profile["tokens"] < cost)
        return;

    if(self.profile["skills"][skill] >= 5)
        return;

    self.profile["tokens"] -= cost;
    self.profile["skills"][skill]++;

    self applySkills();
}

function applySkills()
{
    hp = self.profile["skills"]["hp"];
    dmg = self.profile["skills"]["dmg"];
    speed = self.profile["skills"]["speed"];

    self.maxhealth = 100 + (hp * 25);
    self.damageMult = 1 + (dmg * 0.1);
    self.speedMult = 1 + (speed * 0.05);
}
