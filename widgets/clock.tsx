import { createPoll } from "ags/time"
import { produce } from "immer"

export function Clock(){
    const date = createPoll("", 1000, () => new Date().toString())
    return (
        <label class="clock" label={date} />
    )
}
