for index, force in pairs(game.forces) do
	local technologies = force.technologies
	local recipes = force.recipes

	if technologies["bjnick-metal-recycling"].researched then
	recipes["both-recycling-furnace"].enabled = true
	end
	if technologies["bjnick-metal-recycling-2"].researched then
	recipes["shredding-machine"].enabled = true
	end

	recipes["electric-iron-recycling-furnace"].reload()
	recipes["electric-copper-recycling-furnace"].reload()
	recipes["electric-both-recycling-furnace"].reload()
end