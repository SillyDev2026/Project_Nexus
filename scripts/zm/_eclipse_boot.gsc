#using scripts\shared\util_shared;

function init()
{
    iprintlnbold("ECLIPSE BOOTED");
    level thread start();
}

function start()
{
    iprintlnbold("PROJECT ECLIPSE BOOTED");

    level thread onPlayerConnect();
}
