------------------------------ Make Prisoner------------------------------
function ulx.makeprisoner( calling_ply, target_plys )
	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]
		
	if calling_ply.ThisCommandLastCall and calling_ply.ThisCommandLastCall + 3600 >= CurTime() then return ULib.tsayError( calling_ply, v:Nick() .. " Wait till the next map change", true ) end
	calling_ply.ThisCommandLastCall = CurTime()

		if ulx.getExclusive( v, calling_ply ) then
			ULib.tsayError( calling_ply, ulx.getExclusive( v, calling_ply ), true )
		//elseif not v:Alive() then
		//	ULib.tsayError( calling_ply, v:Nick() .. " is already dead!", true )
		elseif v:IsFrozen() then
			ULib.tsayError( calling_ply, v:Nick() .. " is frozen!", true )
		else
			v:KillSilent()
			v:SetTeam(3)
			table.insert( affected_plys, v )			
		end
	end

	ulx.fancyLogAdmin( calling_ply, "#A changed the team of #T", affected_plys )
end
local makeprisoner = ulx.command( CATEGORY_NAME, "ulx makeprisoner", ulx.makeprisoner, "!makeprisoner" )
makeprisoner:addParam{ type=ULib.cmds.PlayersArg }
makeprisoner:defaultAccess( ULib.ACCESS_ADMIN )
makeprisoner:help( "Changes the team of the target(s) to prisoner." )

------------------------------ Make Guard ------------------------------

function ulx.makeguard( calling_ply, target_plys )
	local affected_plys = {}

	for i=1, #target_plys do
		local v = target_plys[ i ]

		
	if LastCall and LastCall + 3600 >= CurTime() then return ULib.tsayError( calling_ply, v:Nick() .. " Wait till the next map change", true ) end
	LastCall = CurTime()
		
		if ulx.getExclusive( v, calling_ply ) then
			ULib.tsayError( calling_ply, ulx.getExclusive( v, calling_ply ), true )
		//elseif not v:Alive() then
		//	ULib.tsayError( calling_ply, v:Nick() .. " is already dead!", true )
		elseif v:IsFrozen() then
			ULib.tsayError( calling_ply, v:Nick() .. " is frozen!", true )
		else
			v:KillSilent()
			v:SetTeam(4)
			table.insert( affected_plys, v )			
		end
	end

	ulx.fancyLogAdmin( calling_ply, "#A changed the team of #T", affected_plys )
end
local makeguard = ulx.command( CATEGORY_NAME, "ulx makeguard", ulx.makeguard, "!makeguard" )
makeguard:addParam{ type=ULib.cmds.PlayersArg }
makeguard:defaultAccess( ULib.ACCESS_ADMIN )
makeguard:help( "Changes the team of the target(s) to prisoner." )