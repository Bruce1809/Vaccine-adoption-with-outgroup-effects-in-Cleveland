extensions [ nw ]

turtles-own
[
  group  ;;0 for red, 1 for blue
  adopted?
  adopt ;; adoption sstatus if adopted/ true [adopt = 1]
  non-adopter? ;; if true, then never adopts, ever.
]
patches-own[
  patchnumber
  share
  edges
  link-count
  patch-links
  patch-turtle-count
  local-polarization
  local-adoption
  actual-adoption
]


globals [
  linked
  in-group
  partner-group
  partner
  partner2
  random-link
  random-turtle
  random-turtle2
  polarization
  current-adopted
  group0-adopted
  group1-adopted
  glob-polarization
  avg-local-polarization
]

to setup
  clear-all
  set-default-shape turtles "circle"
  create-nodes
  connect-nodes
  set current-adopted 0
  establish-seeds
  ask patches [
    ;show patchnumber show actual-adoption
  ]
  reset-ticks
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;         SETUP ROUTINES
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to create-nodes ;; this routine creates the nodes for the 6 patches, and assigns groups based on user input
  ask patches [
    set pcolor white
    set patchnumber pxcor + pycor * 3 + 1
    if patchnumber = 1 [
      let i 0
      let j 0
      sprout n1 [
        let grid-floor ceiling sqrt n1
        let space .7 / grid-floor
        ifelse random-float 1 > redpct1 [
          set group 1
          set color 97
          ifelse random-float 1 < neverAdoptPctBlue / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ][
          set group 0
          set color 17
          ifelse random-float 1 < neverAdoptPctRed / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ]
        set xcor xcor - 0.35 + space * i
        set ycor ycor  - 0.35 + space * j
        set size 0.05
        set adopt 0
        set adopted? false
        set i i + 1
        if i mod grid-floor = 0 [set j j + 1 set i 0]
      ]
      set actual-adoption .59
    ]
     if patchnumber = 2 [
      let i 0
      let j 0
      sprout n2 [
        let grid-floor ceiling sqrt n2
        let space .7 / grid-floor
        ifelse random-float 1 > redpct2 [
          set group 1
          set color 97
          ifelse random-float 1 < neverAdoptPctBlue / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ][
          set group 0
          set color 17
          ifelse random-float 1 < neverAdoptPctRed / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ]
        set xcor xcor - 0.35 + space * i
        set ycor ycor - 0.35 + space * j
        set size 0.05
        set adopt 0
        set adopted? false
        set i i + 1
        if i mod grid-floor = 0 [set j j + 1 set i 0]

        ]
      set actual-adoption .55
      ]
      if patchnumber = 3 [
      let i 0
      let j 0
      sprout n3 [
        let grid-floor ceiling sqrt n3
        let space .7 / grid-floor
        ifelse random-float 1 > redpct3 [
          set group 1
          set color 97
          ifelse random-float 1 < neverAdoptPctBlue / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ][
          set group 0
          set color 17
          ifelse random-float 1 < neverAdoptPctRed / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ]
        set xcor xcor - 0.35 + space * i
        set ycor ycor - 0.35 + space * j
        set size 0.05
        set adopt 0
        set adopted? false
        set i i + 1
        if i mod grid-floor = 0 [set j j + 1 set i 0]
          ]
      set actual-adoption .58
        ]
      if patchnumber = 4 [
      let i 0
      let j 0
      sprout n4 [
        let grid-floor ceiling sqrt n4
        let space .7 / grid-floor
        ifelse random-float 1 > redpct4 [
          set group 1
          set color 97
          ifelse random-float 1 < neverAdoptPctBlue / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ][
          set group 0
          set color 17
          ifelse random-float 1 < neverAdoptPctRed / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ]
        set xcor xcor - 0.35 + space * i
        set ycor ycor - 0.35 + space * j
        set size 0.05
        set adopt 0
        set adopted? false
        set i i + 1
        if i mod grid-floor = 0 [set j j + 1 set i 0]
          ]
      set actual-adoption .56
        ]
      if patchnumber = 5 [
        let i 0
        let j 0
       sprout n5 [
        let grid-floor ceiling sqrt n5
        let space .8 / grid-floor
        ifelse random-float 1 > redpct5 [
          set group 1
          set color 97
          ifelse random-float 1 < neverAdoptPctBlue / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ][
          set group 0
          set color 17
          ifelse random-float 1 < neverAdoptPctRed / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ]
        set xcor xcor - 0.4 + space * i
        set ycor ycor - 0.4 + space * j
        set size 0.03
        set adopt 0
        set adopted? false
        let neverAdoptPct redpct5 * neverAdoptPctRed + (1 - redpct5) * neverAdoptPctBlue
        set i i + 1
        if i mod grid-floor = 0 [set j j + 1 set i 0]
          ]
      set actual-adoption .57
        ]
      if patchnumber = 6 [
      let i 0
      let j 0
      sprout n6 [
        let grid-floor ceiling sqrt n6
        let space .7 / grid-floor
        ifelse random-float 1 > redpct6 [
          set group 1
          set color 97
          ifelse random-float 1 < neverAdoptPctBlue / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ][
          set group 0
          set color 17
          ifelse random-float 1 < neverAdoptPctRed / 100 [
            set non-adopter? true
          ][
            set non-adopter? false
          ]
        ]
        set xcor xcor - 0.35 + space * i
        set ycor ycor - 0.35 + space * j
        set size 0.05
        set adopt 0
        set adopted? false
        set i i + 1
        if i mod grid-floor = 0 [set j j + 1 set i 0]
          ]
      set actual-adoption .58
        ]
    ]
end


to connect-nodes
  ;; the goal of this routine is to set up unique networks within each patch by having a preferential
  ;;attachment based on nodes with more links and preference for in-group nodes
ask patches [
  set link-count 0
  set random-turtle 0
  set random-link 0
  set in-group 0
  set patch-links nobody
    ;; count the number of turtles in the patch
  let num_turtles count turtles-here
    ;; set edges as a desired number of links to achieve the degree that is set up front
  set edges num_turtles * deg_avg / 2
    ;; select a random turtle from this patch
  set random-turtle one-of turtles-here
  ;;create a link with one-of other turtles-here
  ask random-turtle [
      create-link-with one-of other turtles-here
      set patch-links my-links
      ;show patchnumber show patch-links
    ] ;; set up initial link in each patch
    ask one-of turtles-here[
      if self != random-turtle [
        create-link-with one-of other turtles-here
        set patch-links (link-set patch-links my-links)
      ]
    ]
    set link-count 2
    ;show link-count show count patch-links
    set patch-turtle-count 2
    ;; at this stage there is a single link in a patch
    ;; the while loop below randomly selects a link within the patch, and identifies the turtles on either end (partner and partner2)
    ;; when the number of edges equals the number required for the desired average degree, the process stops.
  while [link-count < edges ][
  ;while [2 * link-count / num_turtles < deg_avg  ][
      ;;choose a partner attached to a random link. this is the heart of the preferential attachment mechanism
      ;; at the early build stage, the random link may be with self, in which case it adds another random link.
      ;show patchnumber show 2 * link-count / num_turtles
      ask turtles-here [

       set patch-links (link-set patch-links my-links )
      ]

      ask turtles-here [
        if link-count >= edges [stop]
        set random-link one-of patch-links
          ;set random-link one-of link-set [links] of turtles-here
          ifelse random-link != nobody [
            set partner one-of [both-ends] of random-link
            ;show partner
          set partner2 other-turtle partner random-link
             ;show partner2
          ask partner [
            set partner-group group
           ]
        set in-group group
        ifelse random-float 1 < group_attch
        [
          ifelse in-group = partner-group
          [
              ;move-to partner
              ;fd .4
            if self != partner [
                create-link-with partner
                set patch-links (link-set patch-links link turtle-number self turtle-number partner)
                set link-count link-count + 1
                ;show "self = partner"
              ]
          ][
              ;move-to partner2
              ;fd .4
            if self != partner2 [
                create-link-with partner2
                set patch-links (link-set patch-links link turtle-number self turtle-number partner2)
                set link-count link-count + 1
              ]
            ]
            ][
          ;move-to partner
            ;fd 3
          ifelse self != partner [
              create-link-with partner
              set link-count link-count + 1
              set patch-links (link-set patch-links link turtle-number self turtle-number partner)
            ]
            [
              set random-turtle one-of other turtles-here
              create-link-with random-turtle
              set patch-links (link-set patch-links link turtle-number self turtle-number random-turtle)
              set link-count link-count + 1
            ]
        ]
        ]
        [
        set random-turtle one-of other turtles-here
          create-link-with random-turtle
          set patch-links (link-set patch-links link turtle-number self turtle-number random-turtle)
          set link-count link-count + 1
        ]
        ;show link-count show count patch-links

        ]
      ]
    ;show link-count
    ;show   count patch-links
    ]
  ask turtles [
    let turtle-group group ; this retains the group connection during the re-wiring
    if random-float 1 < rewirePercent / 100 [
      create-link-with one-of other turtles with [group = turtle-group]
        ask one-of links [die]

    ]
  ]
end

to establish-seeds
  ;;For this initial model, seeds are assumed to be randomly dispersed
  ask patches[
   ask n-of seeds turtles-here [
     if not non-adopter? [
     set adopt 1
     set adopted? true
      set current-adopted current-adopted + 1
     ifelse group = 0 [
        set color 14]
     [
        set color 94]
    ]
  ]
  ]

end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
;          TO GO
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to go
  if ticks = maxticks [stop]
  if all? turtles [ adopted? ] [ stop ]
  ;set current-adopted 0
  ask turtles with [not adopted? and not non-adopter? ] [decide-to-adopt]
  ;ask turtles with [not adopted? ][decide-to-adopt] ;; also calculates innovators using p-value
    ;calculate-adoption-probability
    ;record-adoption-results
  ;]
  ask turtles [update-color]
  report-metrics

  ;ask patches [
  ;  show local-adoption
   ; show actual-adoption
  ;]
    ;show patch-adoption
  ;show adoption-rmse
  tick
end




;;GO ROUTINES

to decide-to-adopt
  ;;Initialize variables
  let ingroup 0
  let outgroup 0

  ;if not non-adopter? [
    ifelse random-float 1.0 < p-value  [
      set adopted? true
      set adopt 1
      set current-adopted current-adopted + 1
    ]
    [
      if any? link-neighbors [
      ifelse group = 1 [
        set ingroup 1
        set outgroup 0
      ]
      [
        set ingroup 0
        set outgroup 1
      ]
    let neighbors-adoption count link-neighbors with [adopted? ] / count link-neighbors ;show neighbors-adoption
    let ingroup-adoption count link-neighbors with [adopted? and group = ingroup] ;show ingroup-adoption
    let outgroup-adoption count link-neighbors with [adopted? and group = outgroup] ;show outgroup-adoption
    let degree count link-neighbors
      ;show ingroup-adoption - outgroup-adoption
    let outgroup-bias-factor (1 - b_outgroup-bias) + (b_outgroup-bias / ( 1 + exp(0 - (ingroup-adoption - outgroup-adoption) / degree * 10)))
    ;let outgroup-bias-factor (1 - b_outgroup-bias) + (b_outgroup-bias / ( 1 + exp(0 - (ingroup-adoption - outgroup-adoption) )))
      ;show ticks
      ;show outgroup-bias-factor
      ;show q-value * neighbors-adoption * outgroup-bias-factor
      if random-float 1.0 < q-value * neighbors-adoption * outgroup-bias-factor [
        set adopted? true
        set adopt 1
        set current-adopted current-adopted + 1
      ]
      ;; This logic if to add "unadopt" action
;      [set adopted? false
;        set adopt 0
;        set current-adopted current-adopted - 1
;      ]
    ]
  ]
 ;]
end

to calculate-adoption-probability

end
to update-color
  if adopted? [
    ifelse group = 0 [
      set color 14
    ][
      set color 94]
  ]
end

to record-adoption-results

end

to report-metrics
  set glob-polarization abs ((count turtles with [group = 0 and adopt = 1] - (count turtles with [group = 1 and adopt = 1])) /
    (count turtles with [group = 0 and adopt = 1] + count turtles with [group = 1 and adopt = 1]))
  ask patches [
    set local-adoption count turtles-here with [adopt = 1]  / count turtles-here
  ]
end

to-report other-turtle [#turtle #link]
  let partnerx 0
  ask #turtle
  [
    ask #link
    [
      set partnerx other-end
    ]
  ]
  report partnerx
end

to-report link-group [#patch]
  let link-members 0
  ask #patch [
    ask turtles-here [
      set link-members link-members + count my-links
    ]
    ;set link-members link-set [links] of turtles-here
  ]
    ;; reports agentset of links in a patch during the while loop.
  ;;"links' doesn't seem to like being filtered by turtles-here (i.e. turtles within a patch)
  ;set link-members link-set [links] of turtles-here
  ;report link-set #turtles-here #patch-links
  report link-members
end
to-report turtle-number [#turtle]
  let turtle-num 0
  ask #turtle[
    set turtle-num  who
  ]
  report turtle-num
end

to-report avg-degree
  report 2 *  count links  / count turtles
end

to-report degree-median
  report median [ count link-neighbors] of turtles
end



to-report adoption
  report count turtles with [adopted?] / count turtles
end

to-report average-local-polarization
  let polarization-sum 0
  let component0 0
  let component1 0
  ask patches [
    let group0-turtles count turtles-here with [group = 0]
    let group1-turtles count turtles-here with [group = 1]
    ifelse group0-turtles != 0 [
      set component0  count turtles-here with [group = 0 and adopt = 1] / group0-turtles
    ]
    [
      set component0 0
    ]
    ifelse group1-turtles != 0 [
      set component1  count turtles-here with [ group = 1 and adopt = 1] / group1-turtles
    ]
    [
      set component1 0
    ]
      set local-polarization abs (component0 - component1)
    set polarization-sum polarization-sum + local-polarization
  ]
  ;sum is weighted by population in each patch
  report polarization-sum / count patches

end
;to-report patch-adoption
;  let patch-adopt []
;  ask patches [
;    set patch-adopt count turtles-here with [adopted?] / count turtles-here
;  ]
;  report patch-adopt
;end

to-report average-local-adoption
  let adoptsum 0
  ask patches [
    ;; Proportion of turtles that have adopted in a patch times the weight of turtles for the patch
    ;set local-adoption count turtles-here with [adopt = 1]  / count turtles-here * count turtles-here / count turtles
    set adoptsum adoptsum + local-adoption * count turtles-here / count turtles
    ;set adoptsum adoptsum + local-adoption
  ]
  report adoptsum
end

;to-report patch-polarization
;  let patch-polar []
;  ask patches [
;    set patch-polar abs (count turtles-here with [adopted? and group = 1] - count turtles-here with [adopted? and group = 0]) /
;    (count turtles-here with [adopted? and group = 1] + count turtles-here with [adopted? and group = 0])
;  ]
; report patch-polar
;end


to-report group0_adoption
  set group0-adopted count turtles with [
    adopted? and
    group = 0
  ]
  report group0-adopted / count turtles with [group = 0]
end

to-report group1_adoption
  set group1-adopted count turtles with [
    adopted? and
    group = 1
  ]
  report group1-adopted / count turtles with [group = 1]
end
to-report adoption-rmse
  let error-sum-sqd 0
  ask patches [
   set error-sum-sqd error-sum-sqd + (actual-adoption - local-adoption) ^ 2
  ]
  ;root mean squared error is weighted by patch population
  report sqrt (error-sum-sqd / count patches)
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
818
419
-1
-1
200.0
1
10
1
1
1
0
0
0
1
0
2
0
1
0
0
1
ticks
30.0

SLIDER
15
57
187
90
n1
n1
0
400
57.0
1
1
NIL
HORIZONTAL

SLIDER
20
372
192
405
n5
n5
0
1000
400.0
1
1
NIL
HORIZONTAL

SLIDER
15
94
187
127
redpct1
redpct1
0
1
0.61
.01
1
NIL
HORIZONTAL

SLIDER
18
133
190
166
n2
n2
0
400
173.0
1
1
NIL
HORIZONTAL

SLIDER
20
173
192
206
redpct2
redpct2
0
1
0.45
.01
1
NIL
HORIZONTAL

SLIDER
25
217
197
250
n3
n3
0
400
30.0
1
1
NIL
HORIZONTAL

SLIDER
26
258
198
291
redpct3
redpct3
0
1
0.61
.01
1
NIL
HORIZONTAL

SLIDER
25
299
197
332
n4
n4
0
400
98.0
1
1
NIL
HORIZONTAL

SLIDER
24
335
196
368
redpct4
redpct4
0
1
0.51
.01
1
NIL
HORIZONTAL

SLIDER
21
408
193
441
redpct5
redpct5
0
1
0.32
.01
1
NIL
HORIZONTAL

SLIDER
15
456
187
489
n6
n6
0
400
73.0
1
1
NIL
HORIZONTAL

SLIDER
15
495
187
528
redpct6
redpct6
0
1
0.56
.01
1
NIL
HORIZONTAL

SLIDER
414
518
586
551
deg_avg
deg_avg
0
40
8.0
1
1
NIL
HORIZONTAL

SLIDER
222
431
394
464
p-value
p-value
0
.2
0.01
.005
1
NIL
HORIZONTAL

SLIDER
224
475
396
508
q-value
q-value
0
1
0.35
.01
1
NIL
HORIZONTAL

SLIDER
223
515
393
548
b_outgroup-bias
b_outgroup-bias
0
1
1.0
.01
1
NIL
HORIZONTAL

SLIDER
410
431
582
464
group_attch
group_attch
0
1
0.0
.01
1
NIL
HORIZONTAL

SLIDER
412
471
583
504
rewirePercent
rewirePercent
0
100
20.0
1
1
Percent
HORIZONTAL

BUTTON
22
16
88
49
setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
1157
236
1268
281
Average Degree
avg-degree
2
1
11

SLIDER
22
531
188
564
seeds
seeds
0
20
5.0
1
1
seeds per patch
HORIZONTAL

SLIDER
224
557
396
590
maxticks
maxticks
0
500
26.0
1
1
ticks
HORIZONTAL

BUTTON
113
22
176
55
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

MONITOR
840
326
965
371
adoption
adoption
2
1
11

MONITOR
411
559
468
604
NIL
ticks
0
1
11

MONITOR
823
378
997
423
Group 0 Adoption Percent
group0_adoption * 100
2
1
11

MONITOR
826
435
1000
480
Group 1 Adoption Percent
group1_adoption * 100
2
1
11

SLIDER
16
605
197
638
neverAdoptPctRed
neverAdoptPctRed
0
100
20.0
1
1
percent
HORIZONTAL

SLIDER
20
568
201
601
neverAdoptPctBlue
neverAdoptPctBlue
0
100
20.0
1
1
percent
HORIZONTAL

PLOT
867
30
1279
232
Degree Distribution
Degree
Number of Nodes
0.0
10.0
0.0
10.0
true
true
"" "set-plot-x-range 1 (max [ count my-links ] of turtles) + 1"
PENS
"All agents" 1.0 0 -16777216 true "" "histogram [ count my-links ] of turtles "
"Group 0" 1.0 0 -2674135 true "" "let red-agents turtles with\n[group = 0]\nhistogram [ count my-links ] of red-agents"
"Group 1" 1.0 0 -13345367 true "" "let blue-agents turtles with\n[group = 1]\nhistogram [ count my-links ] of blue-agents"

MONITOR
866
236
948
281
Min Degree
min [ count link-neighbors] of turtles
2
1
11

MONITOR
957
236
1043
281
Max Degree
max [ count link-neighbors] of turtles
2
1
11

MONITOR
1048
236
1152
281
Median Degree
median [ count link-neighbors] of turtles
0
1
11

PLOT
1015
300
1306
632
Adopted
NIL
Percent adopted
0.0
10.0
0.0
100.0
true
true
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot 100 * count turtles with [adopted? = true] / count turtles"
"Group 0" 1.0 0 -2674135 true "" "plot 100 * count turtles with [adopted? = true and group = 0] / count turtles with [group = 0]"
"Group 1" 1.0 0 -13345367 true "" "plot 100 * count turtles with [adopted? = true and group = 1] / count turtles with [ group = 1]"

PLOT
587
487
989
637
Polarization
NIL
NIL
0.0
10.0
0.0
50.0
true
true
"" ""
PENS
"Global Polarization" 1.0 0 -16777216 true "" "plot 100 * glob-polarization"
"Avg Local Polarization" 1.0 0 -955883 true "" "plot 100 * average-local-polarization"

MONITOR
838
279
938
324
Degree mode
modes [ count link-neighbors] of turtles
17
1
11

MONITOR
609
433
773
478
Root mean-square error
adoption-rmse
2
1
11

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.3.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="CSSExp1" repetitions="50" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>adoption</metric>
    <metric>glob-polarization</metric>
    <metric>average-local-polarization</metric>
    <metric>average-local-adoption</metric>
    <metric>adoption-rmse</metric>
    <metric>group0_adoption</metric>
    <metric>group1_adoption</metric>
    <enumeratedValueSet variable="n5">
      <value value="400"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="seeds">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="p-value">
      <value value="0.005"/>
      <value value="0.01"/>
      <value value="0.015"/>
      <value value="0.02"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="n6">
      <value value="73"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="redpct5">
      <value value="0.32"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rewirePercent">
      <value value="20"/>
      <value value="30"/>
      <value value="40"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="maxticks">
      <value value="26"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="b_outgroup-bias">
      <value value="0"/>
      <value value="0.5"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="redpct6">
      <value value="0.56"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="n1">
      <value value="57"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="q-value">
      <value value="0.3"/>
      <value value="0.35"/>
      <value value="0.4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="neverAdoptPctBlue">
      <value value="0"/>
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="n2">
      <value value="173"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="redpct1">
      <value value="0.61"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="n3">
      <value value="30"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="redpct2">
      <value value="0.45"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="deg_avg">
      <value value="8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="redpct3">
      <value value="0.61"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="neverAdoptPctRed">
      <value value="0"/>
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="group_attch">
      <value value="0"/>
      <value value="0.5"/>
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="redpct4">
      <value value="0.51"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="n4">
      <value value="98"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
