# VMD for MACOSXX86, version 1.9.2 (December 29, 2014)
# Log file '/Users/alexrd/research/WESTPA-WExplore/examples/kcrownether/vis_align.tcl', created by user alexrd
menu files off
menu files on
display resetview
mol addrep 0
display resetview
mol new {/Users/alexrd/research/WESTPA-WExplore/examples/kcrownether/complex_align.pdb} type {pdb} first 0 last -1 step 1 waitfor 1
animate style Loop
menu graphics off
menu graphics on
mol modselect 0 0 not ion
mol color Name
mol representation Lines 1.000000
mol selection not ion
mol material Opaque
mol addrep 0
mol modselect 1 0 ion
mol modstyle 0 0 Licorice 0.300000 12.000000 12.000000
mol modstyle 1 0 VDW 1.000000 12.000000
mol modstyle 1 0 VDW 1.000000 17.000000
mol modstyle 1 0 VDW 1.000000 22.000000
mol rename 0 {big regions}
menu files off
menu files on
mol rename 0 {complex}
menu files off
menu files on
display resetview
mol addrep 1
display resetview
mol new {18-crown-6-K+.pdb} type {pdb} first 0 last -1 step 1 waitfor 1
animate style Loop
animate delete  beg 0 end 0 skip 0 1
menu files off
menu files on
display resetview
mol addfile {big_regions.dcd} type {dcd} first 0 last -1 step 1 waitfor 1 1
animate style Loop
mol top 0
mol modcolor 0 1 ColorID 0
mol modstyle 0 1 VDW 1.600000 22.000000
animate style Loop
mol modmaterial 1 0 Transparent
mol modmaterial 1 0 Opaque
mol modmaterial 0 1 Transparent
mol rename 1 {big regions}
menu files off
menu files on
menu files off
menu files off
menu files on
display resetview
mol addrep 2
display resetview
mol new {18-crown-6-K+.pdb} type {pdb} first 0 last -1 step 1 waitfor 1
animate style Loop
display resetview
mol addrep 3
display resetview
mol new {18-crown-6-K+.pdb} type {pdb} first 0 last -1 step 1 waitfor 1
animate style Loop
mol rename 2 {med regions}
mol rename 3 {small regions}
animate delete  beg 0 end 0 skip 0 2
animate delete  beg 0 end 0 skip 0 3
display resetview
mol addfile {med_regions.dcd} type {dcd} first 0 last -1 step 1 waitfor 1 2
animate style Loop
menu files off
menu files on
display resetview
mol addfile {sml_regions.dcd} type {dcd} first 0 last -1 step 1 waitfor 1 3
animate style Loop
menu clonerep off
menu clonerep on
mol delrep 0 2
mol representation VDW 1.600000 22.000000
mol color ColorID 0
mol selection all
mol material Transparent
mol addrep 2
mol selupdate 0 2 0
mol colupdate 0 2 0
mol scaleminmax 2 0 0.000000 0.000000
mol drawframes 2 0 {now}
mol delrep 0 3
mol representation VDW 1.600000 22.000000
mol color ColorID 0
mol selection all
mol material Transparent
mol addrep 3
mol selupdate 0 3 0
mol colupdate 0 3 0
mol scaleminmax 3 0 0.000000 0.000000
mol drawframes 3 0 {now}
mol modcolor 0 2 ColorID 6
mol modmaterial 0 2 Translucent
mol modstyle 0 2 VDW 1.000000 27.000000
mol modmaterial 0 3 Opaque
mol modstyle 0 3 VDW 0.600000 37.000000
mol modcolor 0 3 ColorID 1
mol showrep 0 1 0
mol drawframes 1 0 {0:100}
mol drawframes 2 0 {0:100}
mol drawframes 3 0 {0:100}
# VMD for MACOSXX86, version 1.9.2 (December 29, 2014)
# end of log file.
