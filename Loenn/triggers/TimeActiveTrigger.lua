local trigger = {
    name = "StunningHelper/TimeActiveTrigger",
    placements = {
        {
            name = "Set TimeActive Trigger",
            data = {
                TimeActive = 0,
                OnEnter = true,
                OnStay = false,
                OnLeave = false
            }
        }
    }
}

return trigger