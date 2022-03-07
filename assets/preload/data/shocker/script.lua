function onUpdate(elapsed)
    -- start of "update", some variables weren't updated yet
    if curStep == 464 then
            doTweenAngle('left', 'camGame', 10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 10, stepCrochet*0.005, 'circOut')        
    elseif curStep == 468  then
            doTweenAngle('left', 'camGame', -10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', -10, stepCrochet*0.005, 'circOut')    
    elseif curStep == 472 then
            doTweenAngle('left', 'camGame', 0, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 0, stepCrochet*0.005, 'circOut')
    end

    if curStep == 496 then
            doTweenAngle('left', 'camGame', 10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 10, stepCrochet*0.005, 'circOut')        
    elseif curStep == 500  then
            doTweenAngle('left', 'camGame', -10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', -10, stepCrochet*0.005, 'circOut')    
    elseif curStep == 504 then
            doTweenAngle('left', 'camGame', 0, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 0, stepCrochet*0.005, 'circOut')    
    end
    if curStep == 592 then
            doTweenAngle('left', 'camGame', 10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 10, stepCrochet*0.005, 'circOut')        
    elseif curStep == 596  then
            doTweenAngle('left', 'camGame', -10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', -10, stepCrochet*0.005, 'circOut')    
    elseif curStep == 600 then
            doTweenAngle('left', 'camGame', 0, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 0, stepCrochet*0.005, 'circOut') 
    end     
    if curStep == 624 then
            doTweenAngle('left', 'camGame', 10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 10, stepCrochet*0.005, 'circOut')        
    elseif curStep == 628  then
            doTweenAngle('left', 'camGame', -10, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', -10, stepCrochet*0.005, 'circOut')    
    elseif curStep == 632 then
            doTweenAngle('left', 'camGame', 0, stepCrochet*0.005, 'circOut')    
            doTweenAngle('left2', 'camHUD', 0, stepCrochet*0.005, 'circOut') 
    end
end