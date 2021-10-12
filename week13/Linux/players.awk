# based on / inspired by
# 8.1.5 Scanning All Elements of an Array - https://www.gnu.org/software/gawk/manual/html_node/Scanning-an-Array.html
# 7.14 Counting String Values 						(OReilly bash Cookbook)
# 7.15 Showing Data As a Quick and Easy Histogram	(OReilly bash Cookbook)

# players.awk - count the players
{
	# NF -> number of fields
	for(i=1; i<= NF; i++)
		# keep count
		player[$i] += 1
}
# output
 END {
		for (p in player)
		{
			printf "%s: %d\n",p,player[p]
		}
}		
