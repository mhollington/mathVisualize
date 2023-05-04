import Bootstrap.Form.Input as Input 
import Html.Events as Events
import Bootstrap.Tab as Tab
        
type alias Model =
    { navKey : Navigation.Key
    , page : Page
    , time : Float
    , navbarState : Navbar.State
    , accordionStates : Accordion.State
    , carouselStates : Carousel.State
    , debug : String
    , tabState : Tab.State 
    }

type Page
    = Home
    | Search String (List String)
    | MatchingGame String
    | MultipleChoice String
    | Intro String
    | NotFound


type Msg
    = UrlChange Url
    | ClickedLink UrlRequest
    | NavbarMsg Navbar.State
    | NoOp
    | AccordionMsg Accordion.State
    | CarouselMsg Carousel.Msg
    | Tick Float
    | UpdateSearch String
    | GoMatchingGame String
    | GoMultipleChoice String
    | GoIntro String
    | TabMsg Tab.State

init : Flags -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( navbarState, navCmd ) =
            Navbar.initialState NavbarMsg

        ( model, urlCmd ) =
            urlUpdate url { navKey = key
                          , navbarState = navbarState
                          , page = Home 
                          , time = 0
                          , accordionStates = Accordion.initialStateCardOpen ""
                            --Accordion.initialStateCardOpen "card1" -- if you put a card id, the accordion starts with that card open
                          , carouselStates = Carousel.initialState
                          , debug = ""
                          , tabState = Tab.initialState
                          }
    in
        ( model, Cmd.batch [ urlCmd, navCmd ] )



subscriptions : Model -> Sub Msg
subscriptions model =
    --ADD ACCORDION - now that there are multiple subscriptions, they need to be grouped in Sub.batch
    Sub.batch [Navbar.subscriptions model.navbarState NavbarMsg
              , Accordion.subscriptions model.accordionStates AccordionMsg 
              , Carousel.subscriptions model.carouselStates CarouselMsg 
              , onAnimationFrame ( \ posix -> Tick ((Time.posixToMillis posix |> toFloat) * 0.001) )
              ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink req ->
             case req of
                 Browser.Internal url ->
                     ({model | debug = Url.toString url}, Navigation.pushUrl model.navKey <| Url.toString url )

                 Browser.External href ->
                     ( model, Navigation.load href )

        UrlChange url ->
            urlUpdate url model

        NavbarMsg state ->
            ( { model | navbarState = state }
            , Cmd.none
            )

        NoOp -> (model, Cmd.none)

        AccordionMsg state ->
            ( { model | accordionStates = state }
            , Cmd.none
            )

        CarouselMsg cMsg ->
            ( {model | carouselStates =  Carousel.update cMsg model.carouselStates             }
            , Cmd.none
            )

        Tick t -> ({ model | time = t }, Cmd.none)
        
        UpdateSearch str ->
                        ({ model | page = parseSearchString str
                        }, Cmd.none )

        GoMatchingGame year ->
            ( { model | page = MatchingGame year }, Cmd.none )
        GoMultipleChoice year ->
            ( { model | page = MultipleChoice year }, Cmd.none )    
        GoIntro year ->
            ( { model | page = Intro year }, Cmd.none )            
        TabMsg state ->
            ( { model | tabState = state }
            , Cmd.none
            )    

filterChars char = if Char.isLower char || Char.isUpper char || Char.isDigit char || char == ' ' then True else False

commonWrds wrd = case wrd of
                  "the" -> False
                  "best" -> False
                  "with" -> False
                  "about" -> False
                  "and" -> False
                  "as" -> False
                  "at" -> False
                  "a" -> False
                  "to" -> False
                  "in" -> False
                  "by" -> False
                  "on" -> False
                  "for" -> False
                  "from" -> False
                  "greatest" -> False
                  "ever" -> False
                  "school" -> False
                  "grade" -> False
                  "catholic" -> False
                  "public" -> False
                  "junior" -> False
                  "senior" -> False
                  "elementary" -> False
                  "secondary" -> False
                  "district" -> False
                  "" -> False
                  _ -> True

resetViewport : Cmd Msg
resetViewport =
  Task.perform (\_ -> NoOp) (Dom.setViewport 0 0)


urlUpdate : Url -> Model -> ( Model, Cmd Msg )
urlUpdate url model =
    case decode url of
        Nothing ->
            ( { model | page = NotFound }, resetViewport )

        Just route ->
            ( { model | page = route, debug = "^"++model.debug }, resetViewport )

decode : Url -> Maybe Page
decode url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
    |> UrlParser.parse routeParser

routeParser : Parser (Page -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map MatchingGame (UrlParser.s "MatchingGame" </> UrlParser.string)
        , UrlParser.map MultipleChoice (UrlParser.s "MultipleChoice" </> UrlParser.string)
        , UrlParser.map Intro (UrlParser.s "Intro" </> UrlParser.string)
        , UrlParser.map parseSearchString (s "search" </> UrlParser.string )
        , UrlParser.map Home top
        ]

parseSearchString : String -> Page 
parseSearchString str =
    let searchString = String.filter filterChars str
        listWords = (String.split " " (String.toLower searchString))
        firstList = List.take ((List.length listWords)-1) listWords
        lastList = List.drop ((List.length listWords)-1) listWords
        searchList = (List.filter commonWrds firstList)++lastList --filter out common words only from fully typed keyword
    in  Search searchString searchList

view : Model -> Browser.Document Msg
view model =
    { --this appears at the top of the browser screen (or on the tab)
      title = case model.page of
          MatchingGame year ->
             year ++ " Matching Game"
             
          MultipleChoice year ->
             year ++ " Multiple Choice"             

          NotFound ->
              "Page Not Found"
          
          _ ->
            "Magic Logarithm Land"
         
    , body =
        [
          Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
        ,  Html.div []
            [ mainContent model
            ]
        ]
    }

mainContent : Model -> Html Msg
mainContent model =
    Grid.container [] -- Wrap in a container to center the navbar
       <|
        ( Navbar.config NavbarMsg
            |> Navbar.withAnimation
            |> Navbar.collapseMedium            -- Collapse menu at the medium breakpoint
            |> Navbar.success                   -- Customize coloring
            |> Navbar.brand                     -- Add logo to your brand with a little styling to align nicely
                [ href "#" ]
                [ Html.img
                    [ src "https://image.flaticon.com/icons/png/512/2106/2106605.png"
                    , class "d-inline-block align-top"
                    , style  "width" "100px" 
                    ]
                    []
                ]
            |> Navbar.items
                [ Navbar.itemLink 
                    [ style  "font-size" "30px", href <| "#Intro/" ++ "Intro" ] [Html.text "Intro" ]
                , Navbar.dropdown        
                    { id = "mydropdown"
                    , toggle = Navbar.dropdownToggle [style  "font-size" "30px"] [ Html.text "Practice" ]
                    , items =
                        [ Navbar.dropdownItem
                                      [ href <| "#MatchingGame/" ++  "Matching Game" ]
                                      [ "Matching Game" |> Html.text ]
                        ,  Navbar.dropdownItem
                                      [ href <| "#MultipleChoice/" ++  "Multiple Choice" ]
                                      [ "Multiple Choice" |> Html.text ]
                               
                               ]
                               
                    }
            ]|> Navbar.view model.navbarState
        )
        ::
        ( case model.page of
            Home ->
                homeBody model
                
            MultipleChoice year -> 
                multiple_choice model year
                
            MatchingGame year ->
                matching_game model year
                
            Intro year ->
                intro model year                
            
            Search searchString searchList ->
                [ Html.text searchString
                , blankLine
                ] 
                ++
                ( List.map (\ wrd -> Html.text (wrd ++ ", ")) searchList )

            NotFound ->
                pageNotFound
        )

        

homeBody : Model -> List (Html Msg)
homeBody model =
    [ Grid.row []
        [ Grid.col []
          [Html.h1 [Spacing.mt5, Spacing.mb2, style "text-align" "center", style "color" "purple"] [ Html.text "Magic Logarithm Land" ]]
          ]
    , Html.img [style "width" "100%", width 500, height 900, src "https://pngimg.com/uploads/fireworks/fireworks_PNG15645.png"] []
    ]

matching_game : Model -> String -> List (Html Msg)
matching_game model year =
    [Html.iframe
         [ style "width" "100%" , width 500, height 900, src "https://macoutreach.rocks/share/539754ae" ]
              []
               ] 
 
multiple_choice model year =
      [Html.iframe
         [ style "width" "100%", width 500, height 900, src "https://macoutreach.rocks/share/160f1882" ]
              []
               ]  
               
intro model year =
      [Html.iframe
         [style "width" "100%", width 500, height 900, src "https://macoutreach.rocks/share/76f2ae7d" ]
              []
               ]               


pageNotFound : List (Html Msg)
pageNotFound =
    [ Html.h1 [Spacing.my4] [ Html.text "Not found" ]
    , Html.text "Sorry, couldn't find that page"
    ]

blankLine = Grid.row [] --this is an empty row (to add blank space)
              [ Grid.col []
                  [ Html.h6[Spacing.my3][] --change spacing number to make empty row bigger or smaller (0-5)
                  ]
              ]
