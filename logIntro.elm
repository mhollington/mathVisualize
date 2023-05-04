import Html exposing (..)
import Html.Attributes as HA


myShapes model =
   case model.state of
        MainPage  ->
            [ backGroundColor
            , GraphicSVG.text "Introduction To Logarithms"
                  |> size 10
                  |> centered
                  |> bold
                  |> filled white
                  |> move (0,40)
            , transButton 50 15 -2 lightYellow 0.7 MainToLogDesrip "Log Description" |> move (0,0)
            , transButton 50 15 -2 lightYellow 0.7 MainToRules "Log Rules" |> move (0,-20)
            , transButton 50 15 -2 lightYellow 0.7 MainToExample "Examples" |> move (0,-40)
            
            ]
        LogDesrip  ->
            [ backGroundColor
              , GraphicSVG.text "What is a Logarithm"
                  |> size 10
                  |> centered
                  |> bold
                  |> filled white
                  |> move (0,36)
              , transButton 38 10 -2 lightYellow 0.5 LogDesripToMain "Menu" |> move (-50,55)
              , transButton 38 10 -2 lightYellow 0.5 LogDesripToRules "Rules" |> move (-7,55)
              , transButton 38 10 -2 lightYellow 0.5 LogDesripToExamples "Examples" |> move (35,55)
              , group
                  [ roundedRect 180 60 2 |> filled white |> move (0,-5) 
                  , roundedRect 180 60 2 |> outlined (solid 0.5) black |> move (0,-5)
                  , GraphicSVG.text "A logarithm is the power to which a number must"
                      |> size 6
                      |> centered
                      |> bold
                      |> filled black
                      |> move (0,13)
                  , GraphicSVG.text "be raised in order to get some other number"
                      |> size 6
                      |> centered
                      |> bold
                      |> filled black
                      |> move (0,4)
                  , GraphicSVG.text "Log_2 (3) = 8" |> size 6 |> centered |> filled black |> move (-50,-15)
                  , GraphicSVG.text "Because that" |> size 6 |> centered |> bold |> filled orange |> move (0,-15)
                  , GraphicSVG.text "2^3 = 8" |> size 6 |> centered |> filled black |> move (50,-15)
                  ]
                      
                    
              ]
        ListOfRule  ->
            [ backGroundColor
              , GraphicSVG.text "List Of Rules"
                  |> size 10
                  |> centered
                  |> bold
                  |> filled white
                  |> move (0,36)
              , transButton 38 10 -2 lightYellow 0.5 RulesToMain "Menu" |> move (-50,55)
              , transButton 38 10 -2 lightYellow 0.5 RulesToLogDescrip "Description" |> move (-7,55)
              , transButton 38 10 -2 lightYellow 0.5 RulesToExample "Examples" |> move (35,55)
              , group
                  [ roundedRect 180 60 2 |> filled white |> move (0,-5) 
                  , roundedRect 180 60 2 |> outlined (solid 0.5) black |> move (0,-5)
                  , GraphicSVG.text "Rules Will be there later...."
                      |> size 6
                      |> centered
                      |> bold
                      |> filled black
                      |> move (0,13)
                 , html 192 128  ( Html.img [HA.width 50, HA.height 50 , HA.align "centered", HA.src "https://www.gamefront.com/storage/images/games/MHHgwdehIpbUM6HKYN764US8lQRAK2HNheazIGCQ.jpeg"]
                                       []) |> move (-96,64)

                  ]
                      ]
                    
        ExampleQuestion  ->
             [ backGroundColor
              , GraphicSVG.text "Example Question"
                  |> size 10
                  |> centered
                  |> bold
                  |> filled white
                  |> move (0,36)
              , transButton 38 10 -2 lightYellow 0.5 ExampleToMain "Menu" |> move (-50,55)
              , transButton 38 10 -2 lightYellow 0.5 ExampleToLogDescrip "Description" |> move (-7,55)
              , transButton 38 10 -2 lightYellow 0.5 ExampleToRules "Rules" |> move (35,55)
              , 
              case model.questionState of
                 Question1 -> group
                                [ roundedRect 180 60 2 |> filled white |> move (0,-5) 
                                , roundedRect 180 60 2 |> outlined (solid 0.5) black |> move (0,-5)
                                , transButton 38 10 -2 lightGreen 0.5 Question1To2 "Next" |> move (65,39)
                                , GraphicSVG.text "Example Question #1"
                                    |> size 6
                                    |> centered
                                    |> bold
                                    |> filled black
                                    |> move (-55,13)
                                ]
                 Question2 -> group
                                [ roundedRect 180 60 2 |> filled white |> move (0,-5) 
                                , roundedRect 180 60 2 |> outlined (solid 0.5) black |> move (0,-5)
                                , transButton 38 10 -2 lightGreen 0.5 Question2To1 "Previous" |> move (-65,39)
                                , GraphicSVG.text "Example Question #2 "
                                    |> size 6
                                    |> centered
                                    |> bold
                                    |> filled black
                                    |> move (-55,13)
                                ,GraphicSVG.text "More Questions Will add ...."
                                    |> size 6
                                    |> centered
                                    |> bold
                                    |> filled black
                                    |> move (-30,3)
                                , GraphicSVG.text "Last Question will have 2 button direct goes to practice"
                                    |> size 6
                                    |> centered
                                    |> bold
                                    |> filled black
                                    |> move (-2,-6)
                                ]
                    
            ]
backGroundColor = square 1000 |> filled lightBlue
            
          

type Msg = Tick Float GetKeyState
         | MainToLogDesrip
         | MainToRules
         | MainToExample
         | LogDesripToMain
         | LogDesripToRules
         | LogDesripToExamples
         | RulesToMain
         | RulesToLogDescrip
         | RulesToExample
         | ExampleToMain
         | ExampleToRules
         | ExampleToLogDescrip
         | Question1To2
         | Question2To1
         
type QuestionState = Question1
                   | Question2


type State = MainPage 
           | LogDesrip 
           | ListOfRule 
           | ExampleQuestion  
      

update msg model =
    case msg of
        Tick t _ ->
            { model | time = t }
        MainToLogDesrip ->
            case model.state of
                MainPage  ->
                    { model | state = LogDesrip  }
                otherwise ->
                    model
        MainToRules ->
            case model.state of
                MainPage  ->
                    { model | state = ListOfRule  }
                otherwise ->
                    model
        MainToExample ->
            case model.state of
                MainPage  ->
                    { model | state = ExampleQuestion   }
                otherwise ->
                    model
        LogDesripToMain ->
            case model.state of
                LogDesrip   ->
                    { model | state = MainPage  }
                otherwise ->
                    model
        LogDesripToRules ->
            case model.state of
                LogDesrip   ->
                    { model | state = ListOfRule  }
                otherwise ->
                    model
        LogDesripToExamples ->
            case model.state of
                LogDesrip   ->
                    { model | state = ExampleQuestion  }
                otherwise ->
                    model
        RulesToMain  ->
            case model.state of
                ListOfRule   ->
                    { model | state = MainPage   }
                otherwise ->
                    model
        RulesToLogDescrip ->
            case model.state of
                ListOfRule   ->
                    { model | state = LogDesrip   }
                otherwise ->
                    model
        RulesToExample ->
            case model.state of
                ListOfRule   ->
                    { model | state = ExampleQuestion   }
                otherwise ->
                    model
        ExampleToMain ->
            case model.state of
                ExampleQuestion   ->
                    { model | state = MainPage   }
                otherwise ->
                    model
        ExampleToRules ->
            case model.state of
                ExampleQuestion   ->
                    { model | state = ListOfRule   }
                otherwise ->
                    model
        ExampleToLogDescrip ->
            case model.state of
                ExampleQuestion   ->
                    { model | state = LogDesrip  }
                otherwise ->
                    model
        Question1To2 ->
            case model.questionState of
                Question1 ->
                    { model | questionState = Question2  }
                otherwise ->
                    model
        Question2To1 ->
            case model.questionState of
                Question2 ->
                    { model | questionState = Question1  }
                otherwise ->
                    model
        



transButton sizeX sizeY posText color sizeOfoutLine msg txt = 
        group [roundedRect sizeX sizeY 2
                          |> filled color
              ,roundedRect sizeX sizeY 2
                          |> outlined (solid sizeOfoutLine) black
              ,GraphicSVG.text txt
                   |> centered
                   |> bold
                   |> size 6
                   |> filled black
                   |> move (0,posText)
               
               ] |> notifyTap msg



type alias Model =
    { time : Float
    , state : State
    , questionState : QuestionState
    }

init : Model
init = { time = 0 
       , state = MainPage
       , questionState = Question1
       }
    
    

