import Html exposing (..)
import Html.Attributes as HA

myShapes model =   case model.question of
                    Question_1  -> 
                        [ background_mg
                        , empty_slot
                        , hint_button |> move (-70, 40) |> notifyTap HintStateChange
                        , case model.hint_state of 
                            Open -> group [  roundedRect 48 10 3 |> filled white 
                                           , roundedRect 48 10 3 |> outlined (solid 0.5) black
                                           , GraphicSVG.text "logy(x/y) = logx - logy" |> filled black |> move (-53, -5) |> scale 0.4 
                                           ] |> move ( -70, 30)
                            Close -> group []
                        , GraphicSVG.text "log3" |> filled black |> scale 0.9 |> move (-10, 20)
                        ]
                        ++ showSolutions solutions_1_1 model.state_1_1 model.pos_1_1 SwitchMouseState_1_1
                        ++ showSolutions solutions_1_2 model.state_1_2 model.pos_1_2 SwitchMouseState_1_2
                        ++ showSolutions solutions_1_3 model.state_1_3 model.pos_1_3 SwitchMouseState_1_3
                        ++
                        [ case model.state_1_1 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_1 
                                                          |> notifyMouseMoveAt Drag_1_1
                                                          |> notifyLeaveAt SwitchMouseState_1_1 
                              Released  -> group []
                        , case model.state_1_2 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_2 
                                                          |> notifyMouseMoveAt Drag_1_2
                                                          |> notifyLeaveAt SwitchMouseState_1_2 
                              Released  -> group [] 
                        , case model.state_1_3 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_3 
                                                          |> notifyMouseMoveAt Drag_1_3
                                                          |> notifyLeaveAt SwitchMouseState_1_3 
                              Released  -> group [] 
                              ]
                    Question_2  ->
                        [ background_mg
                        , empty_slot
                        , hint_button |> move (-70, 40) |> notifyTap HintStateChange
                        , case model.hint_state of 
                            Open -> group [  roundedRect 48 10 3 |> filled white 
                                           , roundedRect 48 10 3 |> outlined (solid 0.5) black
                                           , GraphicSVG.text "log(x^y) = ylogx" |> filled black |> move (-43, -5) |> scale 0.4 
                                           ] |> move ( -70, 30)
                            Close -> group []
                        , GraphicSVG.text "log64" |> filled black |> scale 0.9 |> move (-10, 20)
                        ]
                        ++ showSolutions solutions_2_1 model.state_1_1 model.pos_1_1 SwitchMouseState_1_1
                        ++ showSolutions solutions_2_2 model.state_1_2 model.pos_1_2 SwitchMouseState_1_2
                        ++ showSolutions solutions_2_3 model.state_1_3 model.pos_1_3 SwitchMouseState_1_3
                        ++    
                        [ case model.state_1_1 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_1 
                                                          |> notifyMouseMoveAt Drag_1_1
                                                          |> notifyLeaveAt SwitchMouseState_1_1 
                              Released  -> group []
                        , case model.state_1_2 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_2 
                                                          |> notifyMouseMoveAt Drag_1_2
                                                          |> notifyLeaveAt SwitchMouseState_1_2 
                              Released  -> group [] 
                        , case model.state_1_3 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_3 
                                                          |> notifyMouseMoveAt Drag_1_3
                                                          |> notifyLeaveAt SwitchMouseState_1_3 
                              Released  -> group []                         
                        ]                  
                    Question_3  ->
                        [ background_mg
                        , empty_slot
                        , hint_button |> move (-70, 40) |> notifyTap HintStateChange
                        , case model.hint_state of 
                            Open -> group [  roundedRect 48 10 3 |> filled white 
                                           , roundedRect 48 10 3 |> outlined (solid 0.5) black
                                           , GraphicSVG.text "log(xy) = logx + logy" |> filled black |> move (-53, -5) |> scale 0.4 
                                           ] |> move ( -70, 30)
                            Close -> group []
                        , GraphicSVG.text "log24" |> filled black |> scale 0.9 |> move (-10, 20)
                        ]
                        ++ showSolutions solutions_3_1 model.state_1_1 model.pos_1_1 SwitchMouseState_1_1
                        ++ showSolutions solutions_3_2 model.state_1_2 model.pos_1_2 SwitchMouseState_1_2
                        ++ showSolutions solutions_3_3 model.state_1_3 model.pos_1_3 SwitchMouseState_1_3
                        ++                        
                        [ case model.state_1_1 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_1 
                                                          |> notifyMouseMoveAt Drag_1_1
                                                          |> notifyLeaveAt SwitchMouseState_1_1 
                              Released  -> group []
                        , case model.state_1_2 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_2 
                                                          |> notifyMouseMoveAt Drag_1_2
                                                          |> notifyLeaveAt SwitchMouseState_1_2 
                              Released  -> group [] 
                        , case model.state_1_3 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_3 
                                                          |> notifyMouseMoveAt Drag_1_3
                                                          |> notifyLeaveAt SwitchMouseState_1_3 
                              Released  -> group []                         
                        ] 
                    Question_4  ->
                        [ background_mg
                        , empty_slot
                        , hint_button |> move (-70, 40) |> notifyTap HintStateChange
                        , case model.hint_state of 
                            Open -> group [  roundedRect 48 10 3 |> filled white 
                                           , roundedRect 48 10 3 |> outlined (solid 0.5) black
                                           , GraphicSVG.text "log(x/y) = logx - logy" |> filled black |> move (-53, -5) |> scale 0.4 
                                           ] |> move ( -70, 30)
                            Close -> group []
                        , GraphicSVG.text "log18" |> filled black |> scale 0.9 |> move (-10, 20)
                        ]
                        ++ showSolutions solutions_4_1 model.state_1_1 model.pos_1_1 SwitchMouseState_1_1
                        ++ showSolutions solutions_4_2 model.state_1_2 model.pos_1_2 SwitchMouseState_1_2
                        ++ showSolutions solutions_4_3 model.state_1_3 model.pos_1_3 SwitchMouseState_1_3
                        ++ 
                        [ case model.state_1_1 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_1 
                                                          |> notifyMouseMoveAt Drag_1_1
                                                          |> notifyLeaveAt SwitchMouseState_1_1 
                              Released  -> group []
                        , case model.state_1_2 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_2 
                                                          |> notifyMouseMoveAt Drag_1_2
                                                          |> notifyLeaveAt SwitchMouseState_1_2 
                              Released  -> group [] 
                        , case model.state_1_3 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_3 
                                                          |> notifyMouseMoveAt Drag_1_3
                                                          |> notifyLeaveAt SwitchMouseState_1_3 
                              Released  -> group []                         
                        ]                        
                    Question_5  ->
                        [ background_mg
                        , empty_slot
                        , hint_button |> move (-70, 40) |> notifyTap HintStateChange
                        , case model.hint_state of 
                            Open -> group [  roundedRect 48 10 3 |> filled white 
                                           , roundedRect 48 10 3 |> outlined (solid 0.5) black
                                           , GraphicSVG.text "log(xy) = logx + logy" |> filled black |> move (-53, -5) |> scale 0.4 
                                           ] |> move ( -70, 30)
                            Close -> group []
                        , GraphicSVG.text "log32" |> filled black |> scale 0.9 |> move (-10, 20)
                        ]
                        ++ showSolutions solutions_5_1 model.state_1_1 model.pos_1_1 SwitchMouseState_1_1
                        ++ showSolutions solutions_5_2 model.state_1_2 model.pos_1_2 SwitchMouseState_1_2
                        ++ showSolutions solutions_5_3 model.state_1_3 model.pos_1_3 SwitchMouseState_1_3
                        ++
                        [ case model.state_1_1 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_1 
                                                          |> notifyMouseMoveAt Drag_1_1
                                                          |> notifyLeaveAt SwitchMouseState_1_1 
                              Released  -> group []
                        , case model.state_1_2 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_2 
                                                          |> notifyMouseMoveAt Drag_1_2
                                                          |> notifyLeaveAt SwitchMouseState_1_2 
                              Released  -> group [] 
                        , case model.state_1_3 of                       
                              MouseDown _ -> rect 185 120 |> ghost 
                                                          |> notifyMouseUpAt SwitchMouseState_1_3 
                                                          |> notifyMouseMoveAt Drag_1_3
                                                          |> notifyLeaveAt SwitchMouseState_1_3 
                              Released  -> group []                         
                        ] 
                    EndPage  ->
                        [ background_mg
                        , replay_button |> move (0, -33) |> scale 1.3 |> notifyTap ChangeQuestionCorrect
                        , GraphicSVG.text "Congratulations" |> centered |> filled white |> scale 1.5 |> move (0, 0)
                        , GraphicSVG.text ("Final Score: "++String.fromInt model.score)  |> centered |> filled black |> move (0, -20)                      
                        ] 
                        
type Msg = Tick Float GetKeyState
           | ChangeQuestionCorrect
           | ChangeQuestionWrong
           | Drag_1_1 (Float, Float)
           | Drag_1_2 (Float, Float)
           | Drag_1_3 (Float, Float)
           | SwitchMouseState_1_1 (Float, Float)
           | SwitchMouseState_1_2 (Float, Float)
           | SwitchMouseState_1_3 (Float, Float)  
           | FreezeDrag
           | HintStateChange 

           
type Hint = Open | Close          


type Question = Question_1 
               | Question_2
               | Question_3 
               | Question_4
               | Question_5
               | EndPage
               
               
               
               
type MousePressStates = Released | MouseDown (Float, Float)

update msg model = case msg of
                     Tick t _ -> { model | time = t }
                     HintStateChange -> 
                       case model.hint_state of 
                         Open -> { model | hint_state = Close}
                         Close -> { model | hint_state = Open }
                         
                     ChangeQuestionWrong ->
                       case model.question of
                           Question_1  -> 
                               { model | question = Question_2 
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close
                                       , freeze_drag = False}
                           Question_2  ->
                               { model | question = Question_3
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close
                                       , freeze_drag = False }
                           Question_3  ->
                               { model | question = Question_4
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close 
                                       , freeze_drag = False }    
                           Question_4  ->
                               { model | question = Question_5
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close
                                       , freeze_drag = False}  
                           Question_5  ->
                               { model | question = EndPage }                                  
                           otherwise ->
                               model
                     ChangeQuestionCorrect ->
                       case model.question of
                           Question_1  -> 
                               { model | question = Question_2 
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close
                                       , freeze_drag = False
                                       , score = model.score + 10 }
                           Question_2  ->
                               { model | question = Question_3
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40) 
                                       , hint_state = Close
                                       , freeze_drag = False 
                                       , score = model.score + 10 }
                           Question_3  ->
                               { model | question = Question_4
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close
                                       , freeze_drag = False 
                                       , score = model.score + 10 }    
                           Question_4  ->
                               { model | question = Question_5
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close
                                       , freeze_drag = False
                                       , score = model.score + 10 }  
                           Question_5  ->
                               { model | question = EndPage
                                       , score = model.score + 10} 
                           EndPage ->
                               { model | question = Question_1
                                       , pos_1_1 = (0, -40)
                                       , pos_1_2 = (50, -40)
                                       , pos_1_3 = (-50, -40)
                                       , hint_state = Close
                                       , freeze_drag = False
                                       , score = 0 }
                       
                     FreezeDrag -> {model | freeze_drag = True }                  
                     Drag_1_1 (x, y)    
                        -> if model.freeze_drag == False then 
                               case model.state_1_1 of 
                                   MouseDown (xDelta, yDelta) 
                                       -> { model | pos_1_1 = (x+xDelta, y+yDelta) }
                                   Released 
                                       -> model
                          else
                               case model.state_1_1 of 
                                   MouseDown (xDelta, yDelta) 
                                       -> model
                                   Released 
                                       -> model                          
                            
                     SwitchMouseState_1_1 (x, y)  
                        -> { model | state_1_1 = 
                              case model.state_1_1 of
                                   Released         ->
                                       -- store the vector between the click 
                                       -- and the centre of the shape
                                       let (xPos, yPos) = model.pos_1_1 
                                       in MouseDown (xPos-x, yPos-y)
                                   MouseDown _      -> Released  
                                   
                           }                          
                                                   
                     Drag_1_2 (x, y)    
                        ->  if model.freeze_drag == False then 
                               case model.state_1_2 of 
                                   MouseDown (xDelta, yDelta) 
                                       -> { model | pos_1_2 = (x+xDelta, y+yDelta) }
                                   Released 
                                       -> model
                          else
                               case model.state_1_2 of 
                                   MouseDown (xDelta, yDelta) 
                                       -> model
                                   Released 
                                       -> model
                     SwitchMouseState_1_2 (x, y)  
                        -> { model | state_1_2 = 
                              case model.state_1_2 of
                                   Released         ->
                                       -- store the vector between the click 
                                       -- and the centre of the shape
                                       let (xPos, yPos) = model.pos_1_2 
                                       in MouseDown (xPos-x, yPos-y)
                                   MouseDown _      -> Released  
                                   
                           }
                     Drag_1_3 (x, y)    
                        ->  if model.freeze_drag == False then 
                               case model.state_1_3 of 
                                   MouseDown (xDelta, yDelta) 
                                       -> { model | pos_1_3 = (x+xDelta, y+yDelta) }
                                   Released 
                                       -> model
                          else
                               case model.state_1_3 of 
                                   MouseDown (xDelta, yDelta) 
                                       -> model
                                   Released 
                                       -> model
                     SwitchMouseState_1_3 (x, y)  
                        -> { model | state_1_3 = 
                              case model.state_1_3 of
                                   Released         ->
                                       -- store the vector between the click 
                                       -- and the centre of the shape
                                       let (xPos, yPos) = model.pos_1_3 
                                       in MouseDown (xPos-x, yPos-y)
                                   MouseDown _      -> Released  
                                   
                           }
init = { time = 0
       , score = 0
       , question = Question_1
       , pos_1_1 = (0,-40)
       , state_1_1 = Released
       , pos_1_2 = (50, -40)
       , state_1_2 = Released
       , pos_1_3 = (-50, -40)
       , state_1_3 = Released
       , freeze_drag = False
       , hint_state = Close
       }


showSolutions sol state pos msg =
              if state == Released && Tuple.first pos > -1.5 &&
              Tuple.first pos < 1.1 && Tuple.second pos < 1.4 &&
              Tuple.second pos > -1.45 then
                    if sol.is_correct == True then
                           [ rect 500 500 
                               |> filled blue
                               |> makeTransparent 0
                               |> notifyEnter FreezeDrag
                               
                            , check_mark |> move (-66, 0) |> scale 0.8
                            
                            , plus_ten |> scale 0.8 |> move (-76, -30)
                            
                            , next_button 
                              |> move (70, 53) 
                              |> notifyTap ChangeQuestionCorrect
                              
                                  ]
                   else
                         [ rect 500 500 
                               |> filled blue
                               |> makeTransparent 0
                               |> notifyEnter FreezeDrag
                               
                          , wrong_symbol |> move (-76, 0)
                          
                          , next_button 
                              |> move (70, 53) 
                              |> notifyTap ChangeQuestionWrong 
                             
                           ]


                              
                     
                -- when this happens it changes the score and the page 
              else 
               [ sol.form 
                |> move pos
                |> notifyMouseDownAt msg ]              
                

check_mark = group [ polygon [(-16.32,0.7289),(-27.99,10.350),(-20.70,14.724),(-16.61,7.7266)
                             ,(-12.53,15.599),(-6.414,23.471),(-0.291,28.136),(-0.583,22.013)
                             ,(0.2915,17.640),(-4.082,15.015),(-7.580,11.808),(-11.66,7.1435)
                             ,(-16.32,0.7289)]
                     |> filled green 
                  , polygon [(-16.32,0.7289),(-27.99,10.350),(-20.70,14.724),(-16.61,7.7266)
                             ,(-12.53,15.599),(-6.414,23.471),(-0.291,28.136),(-0.583,22.013)
                             ,(0.2915,17.640),(-4.082,15.015),(-7.580,11.808),(-11.66,7.1435)
                             ,(-16.32,0.7289)]
                     |> outlined (solid 0.4) black   
                   ]
                   
wrong_symbol = group [ polygon [(16.911,10.933),(30.615,25.220),(34.988,24.346),(44.318,14.724)
                               ,(43.735,9.4760),(30.323,-3.353),(38.779,-12.10),(44.610,-18.80)
                               ,(43.444,-22.01),(33.239,-32.21),(30.906,-32.51),(27.699,-30.46)
                               ,(16.036,-18.51),(7.2892,-26.09),(1.7494,-31.05),(-0.874,-32.80)
                               ,(-6.123,-29.30),(-14.87,-20.84),(-14.28,-16.47),(-0.874,-3.936)
                               ,(-0.291,-2.478),(-9.913,6.2687),(-14.28,12.100),(-9.621,19.972)
                               ,(-2.041,26.387),(2.6241,23.763),(9.6218,16.765),(16.911,10.933)]
                      |> filled red 
                      |> scale 0.4
                     , polygon [(16.911,10.933),(30.615,25.220),(34.988,24.346),(44.318,14.724)
                               ,(43.735,9.4760),(30.323,-3.353),(38.779,-12.10),(44.610,-18.80)
                               ,(43.444,-22.01),(33.239,-32.21),(30.906,-32.51),(27.699,-30.46)
                               ,(16.036,-18.51),(7.2892,-26.09),(1.7494,-31.05),(-0.874,-32.80)
                               ,(-6.123,-29.30),(-14.87,-20.84),(-14.28,-16.47),(-0.874,-3.936)
                               ,(-0.291,-2.478),(-9.913,6.2687),(-14.28,12.100),(-9.621,19.972)
                               ,(-2.041,26.387),(2.6241,23.763),(9.6218,16.765),(16.911,10.933)]
                      |> outlined (solid 1) black
                      |> scale 0.4
                      ]
                      
 
plus_ten = group [ polygon [(-19.53,20.264),(-19.53,27.845),(-19.53,29.011),(-17.49,29.886),(-11.95,29.594),(-11.07,28.428)
                          ,(-10.78,20.264),(-7.289,19.972),(-3.207,19.972),(-1.166,18.806)
                          ,(-1.166,15.890),(-1.457,12.391),(-2.332,11.517),(-3.790,10.933)
                          ,(-8.747,11.225),(-11.07,10.933),(-11.07,4.5193),(-11.66,1.8952)
                          ,(-13.70,1.3120),(-18.36,1.3120),(-20.11,2.1867),(-20.11,8.6013)
                          ,(-20.41,10.933),(-25.36,11.225),(-28.57,11.225)
                          ,(-30.03,12.683),(-30.03,18.514),(-29.15,19.681),(-26.82,20.264)
                          ,(-19.53,20.264)]
                  |> filled green 
                  |> move (0, 30)
                  |> scale 0.4
                  
                ,  polygon [(-19.53,20.264),(-19.53,27.845),(-19.53,29.011),(-17.49,29.886),(-11.95,29.594),(-11.07,28.428)
                          ,(-10.78,20.264),(-7.289,19.972),(-3.207,19.972),(-1.166,18.806)
                          ,(-1.166,15.890),(-1.457,12.391),(-2.332,11.517),(-3.790,10.933)
                          ,(-8.747,11.225),(-11.07,10.933),(-11.07,4.5193),(-11.66,1.8952)
                          ,(-13.70,1.3120),(-18.36,1.3120),(-20.11,2.1867),(-20.11,8.6013)
                          ,(-20.41,10.933),(-25.36,11.225),(-28.57,11.225)
                          ,(-30.03,12.683),(-30.03,18.514),(-29.15,19.681),(-26.82,20.264)
                          ,(-19.53,20.264)]
                  |> outlined (solid 1) black 
                  |> move (0, 30)
                  |> scale 0.4
                , polygon [(-21.86,12.100),(-21.57,26.678),(-22.45,28.136)
                          ,(-24.78,27.261),(-27.69,25.220),(-28.28,23.763),(-27.99,22.888)
                          ,(-26.82,22.305),(-25.65,22.888),(-25.07,23.179),(-25.07,20.264)
                          ,(-25.36,15.307),(-25.36,11.808),(-27.11,11.808),(-28.28,10.933)
                          ,(-28.28,9.7676),(-27.40,9.1845),(-24.20,8.8929),(-20.41,8.8929)
                          ,(-19.53,10.059),(-19.53,10.933),(-20.11,11.808),(-21.86,12.100)]
                  |> filled green |> move (30, 0)
                , polygon [(-21.86,12.100),(-21.57,26.678),(-22.45,28.136)
                          ,(-24.78,27.261),(-27.69,25.220),(-28.28,23.763),(-27.99,22.888)
                          ,(-26.82,22.305),(-25.65,22.888),(-25.07,23.179),(-25.07,20.264)
                          ,(-25.36,15.307),(-25.36,11.808),(-27.11,11.808),(-28.28,10.933)
                          ,(-28.28,9.7676),(-27.40,9.1845),(-24.20,8.8929),(-20.41,8.8929)
                          ,(-19.53,10.059),(-19.53,10.933),(-20.11,11.808),(-21.86,12.100)]
                  |> outlined (solid 0.4) black |> move (30, 0) 
                , oval 14 19 |> filled green |> move (18, 19)
                , oval 14 19 |> outlined (solid 0.4) black |> move (18, 19)
                , oval 6 11 |> filled (rgba 97 126 255 1) |> move (18, 19)
                , oval 6 11 |> outlined (solid 0.4) black |> move (18, 19)

                
                ]
                
replay_button = group [ roundedRect 28 15 3  |> filled (rgba 77 255 198 1)
                      , roundedRect 28.2 15.2 3 |> outlined (solid 1) black
                      , GraphicSVG.text "Replay" |> filled black |> scale 0.7 |> move (-11.6, -3.7)
                      ]              
next_button = group [ roundedRect 28 15 3  |> filled (rgba 77 255 198 1)
                    , roundedRect 28.2 15.2 3 |> outlined (solid 1) black
                    , GraphicSVG.text "Next" |> filled black |> scale 0.7 |> move (-7.6, -3.5)]


hint_button = group [ roundedRect 28 15 3  |> filled (rgba 77 255 198 1)
                    , roundedRect 28.2 15.2 3 |> outlined (solid 1) black
                    , GraphicSVG.text "Hint" |> filled black |> scale 0.7 |> move (-7.6, -3.5)] |> scale 0.7
                    
empty_slot = group [roundedRect 38 18 5 |> filled lightGrey
                    , roundedRect 38.2 18.2 5 |> outlined (solid 1) black 
                    ]

background_mg = group [ html 800 500
                        ( Html.img [HA.width 192, HA.height 140
                        , HA.align "centered"
                        , HA.src "https://png.pngtree.com/thumb_back/fw800/background/20190223/ourmid/pngtree-hand-drawn-forest-firefly-fantasy-background-paintedcartoonfreshgreenfireflyforest-backgroundadvertising-backgroundbackground-image_67938.jpg"]
                        []
                        )
                        |> move (-96,70)
                      , GraphicSVG.text "Matching Game" |> filled white |> scale 1.3 |> move (-50, 50)
                      , GraphicSVG.text "Drag the equivalent logarithm expression to the slot." |> filled white
                         |> scale 0.4 |> move (-48, 40)]
 
type alias Solutions userMsg = { form : Shape userMsg
                               , is_correct : Bool
                                 }   
                         
solutions_1_1 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "log9 - log3" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = True
                }
               
solutions_1_2 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "log9 + log3" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = False
                }                

solutions_1_3 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                , GraphicSVG.text "log3 - log9" |> filled black |> move (-29, -4) |> scale 0.5
                                ] )
                , is_correct = False
                } 
                
solutions_2_1 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "8log2" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = False
                }
               
solutions_2_2 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "6log2" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = False
                }                

solutions_2_3 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                , GraphicSVG.text "5log2" |> filled black |> move (-29, -4) |> scale 0.5
                                ] )
                , is_correct = True
                }                 

solutions_3_1 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "log12 + log2" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = True
                }
               
solutions_3_2 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "log12 * log2" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = False
                }                

solutions_3_3 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                , GraphicSVG.text "log12 - log2" |> filled black |> move (-29, -4) |> scale 0.5
                                ] )
                , is_correct = False
                }

solutions_4_1 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "2log90" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = False
                }
               
solutions_4_2 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "log16 + log5" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = False
                }                

solutions_4_3 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                , GraphicSVG.text "log36 - log2" |> filled black |> move (-29, -4) |> scale 0.5
                                ] )
                , is_correct = True
                }

solutions_5_1 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "log33 + log1" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = False
                }
               
solutions_5_2 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                  , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                  , GraphicSVG.text "log32 + log1" |> filled black |> move (-29, -4) |> scale 0.5
                                  ] )
                , is_correct = True
                }                

solutions_5_3 = { form = ( group [roundedRect 35 15 5 |> filled pink
                                , roundedRect 35.2 15.2 5 |> outlined (solid 1) black 
                                , GraphicSVG.text "32*log2" |> filled black |> move (-29, -4) |> scale 0.5
                                ] )
                , is_correct = False
                }

