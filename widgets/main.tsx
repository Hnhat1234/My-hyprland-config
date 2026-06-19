import app from "ags/gtk4/app"
import { Astal } from "ags/gtk4"
import { Clock } from "./clock.tsx"
import css from "./style.css"

const { TOP } = Astal.WindowAnchor

function Bar(){
    return (
        <window visible anchor={TOP} class="Bar">
            <box>
                <Clock/>
            </box>
        </window>
    ) 
} 
app.start({
    css: css,
    main(){
       Bar()
    },
})
