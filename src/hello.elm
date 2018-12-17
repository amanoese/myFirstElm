import Browser
import Html exposing (..) --(h1, div, p, text)
import Html.Events exposing (onClick)

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
  div []
    [ button [ onClick Increment ] [ text "+" ]
    , div [] [ text (String.fromInt model.count) ]
    , button [ onClick Decrement ] [ text "-" ]
    , div [] []
    , button [ onClick Push ] [ text "push" ]
    , div [] [ text (String.fromInt model.count2) ]
    ]
