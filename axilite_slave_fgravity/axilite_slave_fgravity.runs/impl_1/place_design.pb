
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
82default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3373.8282default:default2
0.0002default:default2
32712default:default2
57612default:defaultZ17-722h px? 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 47c75f32
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.03 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3271 ; free virtual = 57612default:defaulth px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3373.8282default:default2
0.0002default:default2
32712default:default2
57612default:defaultZ17-722h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 13bf0e9db
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.78 ; elapsed = 00:00:00.33 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3285 ; free virtual = 57752default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 1241a6273
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.75 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3291 ; free virtual = 57832default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 1241a6273
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.75 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3291 ; free virtual = 57832default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 1241a6273
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.76 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3291 ; free virtual = 57832default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px? 
C
.Phase 2.1 Floorplanning | Checksum: 17305c74c
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:03 ; elapsed = 00:00:00.90 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3289 ; free virtual = 57812default:defaulth px? 
?

Phase %s%s
101*constraints2
2.2 2default:default25
!Update Timing before SLR Path Opt2default:defaultZ18-101h px? 
W
BPhase 2.2 Update Timing before SLR Path Opt | Checksum: 1719a60d5
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:03 ; elapsed = 00:00:00.99 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3289 ; free virtual = 57812default:defaulth px? 
?

Phase %s%s
101*constraints2
2.3 2default:default24
 Post-Processing in Floorplanning2default:defaultZ18-101h px? 
V
APhase 2.3 Post-Processing in Floorplanning | Checksum: 1719a60d5
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:03 ; elapsed = 00:00:01 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3289 ; free virtual = 57812default:defaulth px? 
x

Phase %s%s
101*constraints2
2.4 2default:default2)
Global Placement Core2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
2.4.1 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px? 
?
FFound %s LUTNM shape to break, %s LUT instances to create LUTNM shape
553*physynth2
02default:default2
312default:defaultZ32-1035h px? 
?
YBreak lutnm for timing: one critical %s, two critical %s, total %s, new lutff created %s
561*physynth2
02default:default2
02default:default2
02default:default2
02default:defaultZ32-1044h px? 
?
^End %s Pass. Optimized %s %s. Breaked %s %s, combined %s existing %s and moved %s existing %s
576*physynth2
12default:default2
132default:default2 
nets or LUTs2default:default2
02default:default2
LUT2default:default2
132default:default2
LUTs2default:default2
02default:default2
LUT2default:defaultZ32-1138h px? 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
0No setup violation found.  %s was not performed.344*physynth2-
DSP Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2;
'Shift Register to Pipeline Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2/
Shift Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2.
BRAM Register Optimization2default:defaultZ32-670h px? 
?
0No setup violation found.  %s was not performed.344*physynth2.
URAM Register Optimization2default:defaultZ32-670h px? 
o
KNo candidate nets found for dynamic/static region interface net replication521*physynthZ32-949h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:00.012default:default2
3373.8282default:default2
0.0002default:default2
32472default:default2
57492default:defaultZ17-722h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
?-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  LUT Combining                                    |            0  |             13  |                    13  |           0  |           1  |  00:00:00  |
|  Retime                                           |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |            0  |             13  |                    13  |           0  |           4  |  00:00:00  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
S
>Phase 2.4.1 Physical Synthesis In Placer | Checksum: ba7d9da6
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:15 ; elapsed = 00:00:04 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3247 ; free virtual = 57482default:defaulth px? 
J
5Phase 2.4 Global Placement Core | Checksum: c11e11ca
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:15 ; elapsed = 00:00:04 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3246 ; free virtual = 57482default:defaulth px? 
C
.Phase 2 Global Placement | Checksum: c11e11ca
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:15 ; elapsed = 00:00:04 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3246 ; free virtual = 57482default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1417e3ab6
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:16 ; elapsed = 00:00:04 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3246 ; free virtual = 57482default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 1b01eb601
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:16 ; elapsed = 00:00:04 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3245 ; free virtual = 57472default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 2011b1161
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:16 ; elapsed = 00:00:04 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3245 ; free virtual = 57472default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 1d5e00d67
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:16 ; elapsed = 00:00:04 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3245 ; free virtual = 57472default:defaulth px? 


Phase %s%s
101*constraints2
3.5 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.5 Small Shape Detail Placement | Checksum: 1141df849
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:17 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3244 ; free virtual = 57472default:defaulth px? 
u

Phase %s%s
101*constraints2
3.6 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.6 Re-assign LUT pins | Checksum: 17472b466
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:17 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3244 ; free virtual = 57462default:defaulth px? 
?

Phase %s%s
101*constraints2
3.7 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.7 Pipeline Register Optimization | Checksum: 1f4986213
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:17 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3244 ; free virtual = 57462default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 1f4986213
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:17 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3244 ; free virtual = 57462default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
V
APost Placement Optimization Initialization | Checksum: 1c3d9c5fb
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
a

Starting %s Task
103*constraints2&
Physical Synthesis2default:defaultZ18-103h px? 
?

Phase %s%s
101*constraints2
1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
82default:defaultZ32-721h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
3.3792default:default2
0.0002default:defaultZ32-619h px? 
U
@Phase 1 Physical Synthesis Initialization | Checksum: 117b0a50d
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.20 ; elapsed = 00:00:00.05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3240 ; free virtual = 57432default:defaulth px? 
?
?BUFG insertion identified %s candidate nets. Inserted BUFG: %s, Replicated BUFG Driver: %s, Skipped due to Placement/Routing Conflicts: %s, Skipped due to Timing Degradation: %s, Skipped due to Illegal Netlist: %s.43*	placeflow2
02default:default2
02default:default2
02default:default2
02default:default2
02default:default2
02default:defaultZ46-56h px? 
J
5Ending Physical Synthesis Task | Checksum: 14aa02f44
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.20 ; elapsed = 00:00:00.06 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3240 ; free virtual = 57432default:defaulth px? 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 1c3d9c5fb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3240 ; free virtual = 57432default:defaulth px? 
?

Phase %s%s
101*constraints2
4.1.1.2 2default:default26
"Post Placement Timing Optimization2default:defaultZ18-101h px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
3.3792default:defaultZ30-746h px? 
\
GPhase 4.1.1.2 Post Placement Timing Optimization | Checksum: 22097c0cb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3240 ; free virtual = 57432default:defaulth px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3240 ; free virtual = 57432default:defaulth px? 
N
9Phase 4.1 Post Commit Optimization | Checksum: 22097c0cb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3240 ; free virtual = 57432default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 22097c0cb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3240 ; free virtual = 57432default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 


Phase %s%s
101*constraints2
4.3.1 2default:default2.
Print Estimated Congestion2default:defaultZ18-101h px? 
?
'Post-Placement Estimated Congestion %s
38*	placeflow2?
?
 ____________________________________________________
|           | Global Congestion | Short Congestion  |
| Direction | Region Size       | Region Size       |
|___________|___________________|___________________|
|      North|                1x1|                1x1|
|___________|___________________|___________________|
|      South|                1x1|                1x1|
|___________|___________________|___________________|
|       East|                1x1|                1x1|
|___________|___________________|___________________|
|       West|                1x1|                1x1|
|___________|___________________|___________________|
2default:defaultZ30-612h px? 
R
=Phase 4.3.1 Print Estimated Congestion | Checksum: 22097c0cb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3238 ; free virtual = 57422default:defaulth px? 
F
1Phase 4.3 Placer Reporting | Checksum: 22097c0cb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3238 ; free virtual = 57422default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
3373.8282default:default2
0.0002default:default2
32382default:default2
57422default:defaultZ17-722h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3238 ; free virtual = 57422default:defaulth px? 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 258df3f9a
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3238 ; free virtual = 57422default:defaulth px? 
>
)Ending Placer Task | Checksum: 15c09c26b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:19 ; elapsed = 00:00:05 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3238 ; free virtual = 57422default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
662default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:00:212default:default2
00:00:062default:default2
3373.8282default:default2
0.0002default:default2
32452default:default2
57482default:defaultZ17-722h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.572default:default2
00:00:00.152default:default2
3373.8282default:default2
0.0002default:default2
32272default:default2
57372default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/sam/git_workspace/floating-point-axi-lite-slave-interface-/axilite_slave_fgravity/axilite_slave_fgravity.runs/impl_1/design_1_wrapper_placed.dcp2default:defaultZ17-1381h px? 
k
%s4*runtcl2O
;Executing : report_io -file design_1_wrapper_io_placed.rpt
2default:defaulth px? 
?
?report_io: Time (s): cpu = 00:00:00.10 ; elapsed = 00:00:00.16 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3239 ; free virtual = 5743
*commonh px? 
?
%s4*runtcl2?
xExecuting : report_utilization -file design_1_wrapper_utilization_placed.rpt -pb design_1_wrapper_utilization_placed.pb
2default:defaulth px? 
?
%s4*runtcl2l
XExecuting : report_control_sets -verbose -file design_1_wrapper_control_sets_placed.rpt
2default:defaulth px? 
?
?report_control_sets: Time (s): cpu = 00:00:00.05 ; elapsed = 00:00:00.10 . Memory (MB): peak = 3373.828 ; gain = 0.000 ; free physical = 3252 ; free virtual = 5756
*commonh px? 


End Record