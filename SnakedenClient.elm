import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class, classList, style)
import Html.Events exposing (onClick)

-- Model


type alias Model = 
    {
        direction: Direction
        ,name: String
        ,color: String
    }

init : (Model, Cmd Msg)
init = 
    (
     {
      direction = None
      ,name = ""
      ,color = "#333333"
     }
     , Cmd.none
    )
-- Update


type Direction = Up | Down | Left | Right | Jump | None

type Msg
    = NoOp
    | Move Direction


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
        Move d ->
            ( { model | direction = d } , Cmd.none) --need to send some websocket message
            

-- View
view : Model -> Html Msg
view model =
    div
        []
        [
         viewDirectionBtn Up
        ,viewDirectionBtn Down
        ,viewDirectionBtn Left
        ,viewDirectionBtn Right
        ] 

viewDirectionBtn : Direction -> Html Msg  
viewDirectionBtn d =
    let
        show d = case d of
                    Up -> "up"
                    Down -> "Down"
                    Right -> "Right"
                    Left -> "Left"
                    Jump -> "Jump"
                    None -> ""
    in
        button
           [onClick (Move d)]
           [text <| show d]


-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none




main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
    }
