myShapes model = 
  [
  myBackground
 
  ,text ("Multiple Choice Test")
  |> centered
  |> filled black
  |> scale 0.5
  |> move(0,56)
  
  ,text ("Q1) What is log_3(243) equal to?")  
    |> alignLeft
    |> bold
    |> filled black
    |> scale 0.3
    |> move (-94, 48)
  
  ,option1 model.choiceColour1
  ,option2 model.choiceColour2
  ,option3 model.choiceColour3
  ,option4 model.choiceColour4
  
  ,text ("Q2) Which of the following is equivalent to 2^5 = 32?")
    |> alignLeft 
    |> bold
    |> filled black
    |> scale 0.3
    |> move (-94, 9.5)
    
  ,option5 model.choiceColour5
  ,option6 model.choiceColour6
  ,option7 model.choiceColour7
  ,option8 model.choiceColour8
  
  ,text ("Q3) What rule is this: log_a(xy) = log_a(x) + log_a(y)?")
    |> alignLeft 
    |> bold
    |> filled black
    |> scale 0.3
    |> move (-94, -29)
    
  ,option9 model.choiceColour9
  ,option10 model.choiceColour10
  ,option11 model.choiceColour11
  ,option12 model.choiceColour12
  
  ,continue
  
  ,case model.questionState of
    Questions -> square 10 |> ghost
    Continue  -> group
                     [
                       roundedRect 120 80 2 |> filled white |> move (0,-5)
                      ,roundedRect 120 80 2 |> outlined (solid 0.5) black |> move (0,-5)
                      ,text("Score: " ++ String.fromInt((model.score1 + model.score2 + model.score3))++ "/3")
                                  |> centered
                                  |> bold
                                  |> filled orange
                                  |> move(0, 10)
                     
                     ]
       
  ]


type QuestionState = Questions 
                   | Continue

type Choice1 = Yellow1 | Green1
type Choice2 = Yellow2 | Green2
type Choice3 = Yellow3 | Green3
type Choice4 = Yellow4 | Green4
type Choice5 = Yellow5 | Green5
type Choice6 = Yellow6 | Green6
type Choice7 = Yellow7 | Green7
type Choice8 = Yellow8 | Green8
type Choice9 = Yellow9 | Green9
type Choice10 = Yellow10 | Green10
type Choice11 = Yellow11 | Green11
type Choice12 = Yellow12 | Green12

choice1 old = case old of
               Yellow1 -> Green1
               Green1 -> Yellow1
               
choice2 old = case old of
               Yellow2 -> Green2
               Green2 -> Yellow2
               
choice3 old = case old of
               Yellow3 -> Green3
               Green3 -> Yellow3
               
choice4 old = case old of
               Yellow4 -> Green4
               Green4 -> Yellow4
               
choice5 old = case old of
               Yellow5 -> Green5
               Green5 -> Yellow5
               
choice6 old = case old of
               Yellow6 -> Green6
               Green6 -> Yellow6
               
choice7 old = case old of
               Yellow7 -> Green7
               Green7 -> Yellow7
               
choice8 old = case old of
               Yellow8 -> Green8
               Green8 -> Yellow8
               
choice9 old = case old of
               Yellow9 -> Green9
               Green9 -> Yellow9
               
choice10 old = case old of
               Yellow10 -> Green10
               Green10 -> Yellow10
               
choice11 old = case old of
               Yellow11 -> Green11
               Green11 -> Yellow11
               
choice12 old = case old of
               Yellow12 -> Green12
               Green12 -> Yellow12  
               
myBackground = square 200 |> filled (rgb 137 209 255)
             
option1 colour1 = 
  group
  [
    button1 ("A) 81") 42 41 colour1
    |> notifyTap ChoiceClick1
   ]
   
option2 colour2 = 
  group
  [
    button2 ("B) 243") 35 34 colour2
    |> notifyTap ChoiceClick2
  ]  
    
option3 colour3 = 
  group
  [    
    button3 ("C) 5") 28 27 colour3
    |> notifyTap ChoiceClick3
  ]
  
option4 colour4 = 
  group
  [    
    button4 ("D) I don't know") 21 20 colour4
    |> notifyTap ChoiceClick4
  ]
  
option5 colour5 = 
  group
  [    
    button5 ("A) log_2(32) = 5") 3.5 2.5 colour5
    |> notifyTap ChoiceClick5
  ]
  
option6 colour6 = 
  group
  [    
    button6 ("B) log_5(32) = 2") -3.5 -4.5 colour6
    |> notifyTap ChoiceClick6
  ]
  
option7 colour7 = 
  group
  [    
    button7 ("C) log_32(5) = 2") -10.5 -11.5 colour7
    |> notifyTap ChoiceClick7
  ]
  
option8 colour8 = 
  group
  [    
    button8 ("D) log_2(5) = 32") -17.5 -18.5 colour8
    |> notifyTap ChoiceClick8
  ]
  
option9 colour9 = 
  group
  [    
    button9 ("A) Quotient Rule") -35 -36 colour9
    |> notifyTap ChoiceClick9
  ]
  
option10 colour10 = 
  group
  [    
    button10 ("B) Product Rule") -42 -43 colour10
    |> notifyTap ChoiceClick10
  ]
  
option11 colour11 = 
  group
  [    
    button11 ("C) Power Rule") -49 -50 colour11
    |> notifyTap ChoiceClick11
  ]
  
option12 colour12 = 
  group
  [    
    button12 ("D) Change of Base") -56 -57 colour12
    |> notifyTap ChoiceClick12    
  ]
  
continue =
  group
  [    
    continueButton ("Continue") -56 -57 
    |> notifyTap ContinueClick
  ]

button1 someText1 firstHeight1 secondHeight1 col1 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc1 col1) 
  |> move (-78, firstHeight1)
  
  ,text (someText1)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight1)
  ]
  
button2 someText2 firstHeight2 secondHeight2 col2 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc2 col2) 
  |> move (-78, firstHeight2)
  
  ,text (someText2)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight2)
  ]  

button3 someText3 firstHeight3 secondHeight3 col3 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc3 col3) 
  |> move (-78, firstHeight3)
  
  ,text (someText3)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight3)
  ]  

button4 someText4 firstHeight4 secondHeight4 col4 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc4 col4) 
  |> move (-78, firstHeight4)
  
  ,text (someText4)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight4)
  ]  
  
button5 someText5 firstHeight5 secondHeight5 col5 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc5 col5) 
  |> move (-78, firstHeight5)
  
  ,text (someText5)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight5)
  ]    
  
button6 someText6 firstHeight6 secondHeight6 col6 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc6 col6) 
  |> move (-78, firstHeight6)
  
  ,text (someText6)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight6)
  ]      
  
button7 someText7 firstHeight7 secondHeight7 col7 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc7 col7) 
  |> move (-78, firstHeight7)
  
  ,text (someText7)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight7)
  ]
  
button8 someText8 firstHeight8 secondHeight8 col8 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc8 col8) 
  |> move (-78, firstHeight8)
  
  ,text (someText8)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight8)
  ]

button9 someText9 firstHeight9 secondHeight9 col9 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc9 col9) 
  |> move (-78, firstHeight9)
  
  ,text (someText9)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight9)
  ]
  
button10 someText10 firstHeight10 secondHeight10 col10 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc10 col10) 
  |> move (-78, firstHeight10)
  
  ,text (someText10)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight10)
  ]
  
button11 someText11 firstHeight11 secondHeight11 col11 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc11 col11) 
  |> move (-78, firstHeight11)
  
  ,text (someText11)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight11)
  ]
  
button12 someText12 firstHeight12 secondHeight12 col12 = 
  group 
  [ 
  roundedRect 35 5 2 
  |> filled (choiceColourFunc12 col12) 
  |> move (-78, firstHeight12)
  
  ,text (someText12)         
  |> filled black
  |> scale 0.3
  |> move (-94, secondHeight12) 
  ]
  
continueButton someText13 firstHeight13 secondHeight13 = 
  group 
  [ 
  roundedRect 24 5 2 
  |> filled (rgb 255 255 0) 
  |> move (78, firstHeight13)
  
  ,text (someText13)         
  |> filled black
  |> scale 0.3
  |> move (71.5, secondHeight13) 
  ]


choiceColourFunc1 c1 = case c1 of
               Yellow1 -> rgb 255 255 0
               Green1   -> rgb 0 255 0

choiceColourFunc2 c2 = case c2 of
               Yellow2 -> rgb 255 255 0
               Green2   -> rgb 0 255 0
               
choiceColourFunc3 c3 = case c3 of
               Yellow3 -> rgb 255 255 0
               Green3   -> rgb 0 255 0
               
choiceColourFunc4 c4 = case c4 of
               Yellow4 -> rgb 255 255 0
               Green4   -> rgb 0 255 0
               
choiceColourFunc5 c5 = case c5 of
               Yellow5 -> rgb 255 255 0
               Green5   -> rgb 0 255 0
               
choiceColourFunc6 c6 = case c6 of
               Yellow6 -> rgb 255 255 0
               Green6   -> rgb 0 255 0
               
choiceColourFunc7 c7 = case c7 of
               Yellow7 -> rgb 255 255 0
               Green7   -> rgb 0 255 0
               
choiceColourFunc8 c8 = case c8 of
               Yellow8 -> rgb 255 255 0
               Green8   -> rgb 0 255 0
               
choiceColourFunc9 c9 = case c9 of
               Yellow9 -> rgb 255 255 0
               Green9   -> rgb 0 255 0
               
choiceColourFunc10 c10 = case c10 of
               Yellow10 -> rgb 255 255 0
               Green10   -> rgb 0 255 0
               
choiceColourFunc11 c11 = case c11 of
               Yellow11 -> rgb 255 255 0
               Green11   -> rgb 0 255 0
               
choiceColourFunc12 c12 = case c12 of
               Yellow12 -> rgb 255 255 0
               Green12   -> rgb 0 255 0               
                             
type Msg = Tick Float GetKeyState | ChoiceClick1 | ChoiceClick2 | ChoiceClick3 | ChoiceClick4 | ChoiceClick5 | ChoiceClick6 | ChoiceClick7 | ChoiceClick8 | ChoiceClick9 | ChoiceClick10 | ChoiceClick11 | ChoiceClick12 | ContinueClick

update msg model = case msg of
                     Tick t _ -> { model | time = t}
                     ChoiceClick1    ->  if (model.choiceColour1 == Yellow1 && model.choiceColour3 == Green3) then
                                         {
                                           model
                                           | choiceColour1 = Green1
                                           , choiceColour2 = Yellow2
                                           , choiceColour3 = Yellow3
                                           , choiceColour4 = Yellow4
                                           , score1 = model.score1 - 1
                                         }
                                         else if (model.choiceColour1 == Yellow1) then
                                         {
                                           model
                                           | choiceColour1 = Green1
                                           , choiceColour2 = Yellow2
                                           , choiceColour3 = Yellow3
                                           , choiceColour4 = Yellow4
                                           }
                                         
                                         else
                                         {
                                           model
                                           | choiceColour1 = choice1 model.choiceColour1
                                           
                                         }     
                                       
                     ChoiceClick2    -> if (model.choiceColour2 == Yellow2 && model.choiceColour3 == Green3) then
                                         {
                                           model
                                           | choiceColour1 = Yellow1
                                           , choiceColour2 = Green2
                                           , choiceColour3 = Yellow3
                                           , choiceColour4 = Yellow4
                                           , score1 = model.score1 - 1
                                         }
                           
                                        else if (model.choiceColour2 == Yellow2) then
                                         {
                                           model
                                           | choiceColour1 = Yellow1
                                           , choiceColour2 = Green2
                                           , choiceColour3 = Yellow3
                                           , choiceColour4 = Yellow4
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour2 = choice2 model.choiceColour2
                                           
                                         }     
                     
                     ChoiceClick3    -> if (model.choiceColour3 == Yellow3) then
                                         {
                                           model
                                           | score1 = model.score1 + 1
                                           ,choiceColour1 = Yellow1
                                           ,choiceColour2 = Yellow2
                                           ,choiceColour3 = choice3 model.choiceColour3
                                           , choiceColour4 = Yellow4
                                         }
                                         else if (model.choiceColour3 == Green3  && model.score1 > 0) then 
                                         {
                                           model
                                           | score1 = model.score1 - 1
                                           ,choiceColour3 = choice3 model.choiceColour3
                                         }
                                         else
                                         {
                                           model
                                           | score1 = model.score1
                                           ,choiceColour3 = choice3 model.choiceColour3
                                         }

                     ChoiceClick4    -> if (model.choiceColour4 == Yellow4 && model.choiceColour3 == Green3) then
                                         {
                                           model
                                           | choiceColour1 = Yellow1
                                           , choiceColour2 = Yellow2
                                           , choiceColour3 = Yellow3
                                           , choiceColour4 = Green4
                                           , score1 = model.score1 - 1
                                         }
                     
                     
                                       else if (model.choiceColour4 == Yellow4) then
                                         {
                                           model
                                           | choiceColour1 = Yellow1
                                           , choiceColour2 = Yellow2
                                           , choiceColour3 = Yellow3
                                           , choiceColour4 = Green4
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour4 = choice4 model.choiceColour4
                                           
                                         }     
                                         
                     ChoiceClick5    -> if (model.choiceColour5 == Yellow5 && model.choiceColour6 == Green6) then
                                         {
                                           model
                                           | choiceColour5 = Green5
                                           , choiceColour6 = Yellow6
                                           , choiceColour7 = Yellow7
                                           , choiceColour8 = Yellow8
                                           , score2 = model.score2 - 1
                                         }
                                       else if (model.choiceColour5 == Yellow5) then
                                         {
                                           model
                                           | choiceColour5 = Green5
                                           , choiceColour6 = Yellow6
                                           , choiceColour7 = Yellow7
                                           , choiceColour8 = Yellow8
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour5 = choice5 model.choiceColour5
                                           
                                         }   
                     
                     ChoiceClick6    -> if (model.choiceColour6 == Yellow6) then
                                         {
                                           model
                                           | score2 = model.score2 + 1
                                           ,choiceColour5 = Yellow5
                                           ,choiceColour6 = choice6 model.choiceColour6
                                           ,choiceColour7 = Yellow7
                                           , choiceColour8 = Yellow8
                                         }
                                         else if (model.choiceColour6 == Green6  && model.score2 > 0) then 
                                         {
                                           model
                                           | score2 = model.score2 - 1
                                           ,choiceColour6 = choice6 model.choiceColour6
                                         }
                                         else
                                         {
                                           model
                                           | score2 = model.score2
                                           ,choiceColour6 = choice6 model.choiceColour6
                                         }
                     
                     ChoiceClick7    -> if (model.choiceColour7 == Yellow7 && model.choiceColour6 == Green6) then
                                         {
                                           model
                                           | choiceColour5 = Yellow5
                                           , choiceColour6 = Yellow6
                                           , choiceColour7 = Green7
                                           , choiceColour8 = Yellow8
                                           , score2 = model.score2 - 1
                                         }
                                         else if (model.choiceColour7 == Yellow7) then
                                         {
                                           model
                                           | choiceColour5 = Yellow5
                                           , choiceColour6 = Yellow6
                                           , choiceColour7 = Green7
                                           , choiceColour8 = Yellow8
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour7 = choice7 model.choiceColour7
                                           
                                         } 
                                         
                     ChoiceClick8    -> if (model.choiceColour8 == Yellow8 && model.choiceColour6 == Green6) then
                                         {
                                           model
                                           | choiceColour5 = Yellow5
                                           , choiceColour6 = Yellow6
                                           , choiceColour7 = Yellow7
                                           , choiceColour8 = Green8
                                           , score2 = model.score2 - 1
                                         }
                                         else if (model.choiceColour8 == Yellow8) then
                                         {
                                           model
                                           | choiceColour5 = Yellow5
                                           , choiceColour6 = Yellow6
                                           , choiceColour7 = Yellow7
                                           , choiceColour8 = Green8
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour8 = choice8 model.choiceColour8
                                           
                                         } 
                                         
                     ChoiceClick9    -> if (model.choiceColour9 == Yellow9 && model.choiceColour10 == Green10) then
                                         {
                                           model
                                           | choiceColour9 = Green9
                                           , choiceColour10 = Yellow10
                                           , choiceColour11 = Yellow11
                                           , choiceColour12 = Yellow12
                                           , score3 = model.score3 - 1
                                         }
                                         else if (model.choiceColour9 == Yellow9) then
                                         {
                                           model
                                           | choiceColour9 = Green9
                                           , choiceColour10 = Yellow10
                                           , choiceColour11 = Yellow11
                                           , choiceColour12 = Yellow12
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour9 = choice9 model.choiceColour9
                                           
                                         }              
                     
                     ChoiceClick10    -> if (model.choiceColour10 == Yellow10) then
                                         {
                                           model
                                           | score3 = model.score3 + 1
                                           ,choiceColour9 = Yellow9
                                           ,choiceColour10 = choice10 model.choiceColour10
                                           ,choiceColour11 = Yellow11
                                           , choiceColour12 = Yellow12
                                         }
                                         else if (model.choiceColour10 == Green10  && model.score3 > 0) then 
                                         {
                                           model
                                           | score3 = model.score3 - 1
                                           ,choiceColour10 = choice10 model.choiceColour10
                                         }
                                         else
                                         {
                                           model
                                           | score3 = model.score3
                                           ,choiceColour10 = choice10 model.choiceColour10
                                         }     
                     
                     ChoiceClick11    -> if (model.choiceColour11 == Yellow11 && model.choiceColour10 == Green10) then
                                         {
                                           model
                                           | choiceColour9 = Yellow9
                                           , choiceColour10 = Yellow10
                                           , choiceColour11 = Green11
                                           , choiceColour12 = Yellow12
                                           , score3 = model.score3 - 1
                                         }
                                         else if (model.choiceColour11 == Yellow11) then
                                         {
                                           model
                                           | choiceColour9 = Yellow9
                                           , choiceColour10 = Yellow10
                                           , choiceColour11 = Green11
                                           , choiceColour12 = Yellow12
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour11 = choice11 model.choiceColour11
                                           
                                         }     
                                         
                     ChoiceClick12    ->  if (model.choiceColour12 == Yellow12 && model.choiceColour10 == Green10) then
                                         {
                                           model
                                           | choiceColour9 = Yellow9
                                           , choiceColour10 = Yellow10
                                           , choiceColour11 = Yellow11
                                           , choiceColour12 = Green12
                                           , score3 = model.score3 - 1
                                         }
                                         else if (model.choiceColour12 == Yellow12) then
                                         {
                                           model
                                           | choiceColour9 = Yellow9
                                           , choiceColour10 = Yellow10
                                           , choiceColour11 = Yellow11
                                           , choiceColour12 = Green12
                                         }
                                         else
                                         {
                                           model
                                           | choiceColour12 = choice12 model.choiceColour12
                                           
                                         }     
                                       
                     ContinueClick    -> case model.questionState of
                                            Questions ->
                                                { model | questionState = Continue  }
                                            otherwise ->
                                                model    

init = { time = 0, score1 = 0, score2 = 0, score3 = 0, questionState = Questions, choiceColour1 = Yellow1, choiceColour2 = Yellow2, choiceColour3 = Yellow3, choiceColour4 = Yellow4, choiceColour5 = Yellow5, choiceColour6 = Yellow6, choiceColour7 = Yellow7, choiceColour8 = Yellow8, choiceColour9 = Yellow9, choiceColour10 = Yellow10, choiceColour11 = Yellow11, choiceColour12 = Yellow12}





