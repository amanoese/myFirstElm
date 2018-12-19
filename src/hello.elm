import Browser
import Html exposing (..) --(h1, div, p, text)
import Html.Events exposing (onClick)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid

type Msg = Increment | Decrement | Push
type alias Model = { count : Int , count2 : Int }

update : Msg -> Model -> Model
update msg model = 
  case msg of
    Increment -> { model | count  = model.count + 1 }
    Decrement -> { model | count  = model.count - 1 }
    Push ->      { model | count2 = model.count2 + 1 }

main =
  Browser.sandbox { init = Model 0 0, update = update, view = view }

view model =
  Grid.container []
    [ CDN.stylesheet
    , Grid.row []
        [ Grid.col []
            [ button [ onClick Increment ] [ text "+" ] ]
        , Grid.col []
            [ div [] [ text (String.fromInt model.count) ] ]
        , Grid.col []
            [ button [ onClick Decrement ] [ text "-" ] ]
        ]
    , Grid.row []
        [ Grid.col []
            [ div [ onClick Push ] [ text ("Push:" ++ String.fromInt model.count2) ] ]
        ]
    ]
