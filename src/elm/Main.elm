module Main exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Utils exposing (noCmds, (=>), pc)
import Cursor
import Roads


main : Program Never Model Msg
main =
    Html.program
        { init = ( init, Cmd.none )
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


type alias Model =
    { cursor : Cursor.Model
    , roads : Roads.Model
    }


type Msg
    = CursorMsg Cursor.Msg


init : Model
init =
    Model
        Cursor.init
        Roads.init


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CursorMsg subMsg ->
            noCmds { model | cursor = Cursor.update subMsg model.cursor }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map CursorMsg Cursor.subscriptions


view : Model -> Html msg
view { cursor, roads } =
    div [ class "wrapper" ]
        [ Cursor.view cursor
        , Roads.view roads
        ]
