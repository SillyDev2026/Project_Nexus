#using scripts\shared\util_shared;

function hudLoop()
{
    self endon("disconnect");

    self.levelHud = createHud(self, 10, 10);
    self.xpHud = createHud(self, 10, 30);
    self.statsHud = createHud(self, 10, 50);

    for(;;)
    {
        self.levelHud setText(
            "LVL " + self.profile["level"] +
            " P" + self.profile["prestige"]
        );

        self.xpHud setText(
            "XP: " + self.profile["xp"] +
            "/" + getXPNeeded()
        );

        self.statsHud setText(
            "K:" + self.profile["kills"] +
            " D:" + self.profile["deaths"] +
            " T:" + self.profile["timePlayed"]
        );

        wait 0.1;
    }
}

function createHud(player, x, y)
{
    hud = newClientHudElem(player);
    hud.horzAlign = "left";
    hud.vertAlign = "top";
    hud.x = x;
    hud.y = y;
    hud.fontScale = 1.3;

    return hud;
}
