function doStuff()


function ClickCallBack(objectHandle, eventData, num)
axesHandle  = get(objectHandle,'Parent');
        coordinates = get(axesHandle,'CurrentPoint'); 
        coordinates = coordinates(1,1:2)
        
for i = 1 : num
    res = (coordinates(1) - props(i).Centroid(1))^2 + (coordinates(2) - props(i).Centroid(2))^2 <= props(i).Radii^2;
    if res == 1
        text(50,50,'coco');
    end
end
end