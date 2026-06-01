

function StartMinigame(cb)
    exports['VGX-MiniGame']:Start({
        color = Config.MinigameColor,
        arrowsPerRound = Config.MinigameArrowsPerRound,
        rounds = Config.MinigameRounds,
        time = Config.MinigameTime,
    }, function(success)
        if cb then 
            cb(success) 
        end
    end)
end