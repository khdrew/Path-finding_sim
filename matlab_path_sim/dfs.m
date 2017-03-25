%% This is a shell that you will have to follow strictly. 
% You will use the plotmap() and viewmap() to display the outcome of your algorithm.

% Load sample_data_map_8, three variables will be created in your workspace. These were created as a 
% result of [m,v,s]=dfs('map_8.txt',[14,1],[1,18]);
% The solution can be viewed using 
% plotmap(m,s) 

% write your own function for the DFS algorithm.
function [retmap,retvisited,retsteps] = dfs( mapfile,startlocation,targetlocation)
    [retmap]=map_convert(mapfile);
    [retvisited] = zeros(15,19);
    retvisited(:,:) = 1;
    retsteps(1,:) = [startlocation(1);startlocation(2)];    
    retvisited(retsteps(1,1),retsteps(1,2)) = 0;
    searching = 1;
    scanning = [startlocation(1);startlocation(2)]
    while(searching == 1)
        path = 0;
        %check up
        check = [scanning(1,1)-1 scanning(1,2)];
        if retmap(check(1),check(2)) == 0
            if retvisited(check(1),check(2)) == 1
                retvisited(check(1),check(2)) = 0;
                path = path + 1;
            end
        end
        %check down
        check = [scanning(1,1)+1 scanning(1,2)];
        if retmap(check(1),check(2)) == 0
            if retvisited(check(1),check(2)) == 1
                retvisited(check(1),check(2)) = 0;
                path = path + 1;
            end
        end
        %check left
        check = [scanning(1,1) scanning(1,2)-1];
        if retmap(check(1),check(2)) == 0
            if retvisited(check(1),check(2)) == 1
                retvisited(check(1),check(2)) = 0;
                path = path + 1;
            end
        end
        %check right
        check = [scanning(1,1) scanning(1,2)+1];
        if retmap(check(1),check(2)) == 0
            if retvisited(check(1),check(2)) == 1
                retvisited(check(1),check(2)) = 0;
                path = path + 1;
            end
        end
        
        
        searching = 0;
    end
  
    %format(index,:) = [y,x];
    retsteps(2,:) = [targetlocation(1);targetlocation(2)];

end



function placestep(position,i)
% This function will plot a insert yellow rectangle and also print a number in this rectangle. Use with plotmap/viewmap. 
position = [16-position(1) position(2)];
position=[position(2)+0.1 position(1)+0.1];
rectangle('Position',[position,0.8,0.8],'FaceColor','y');
c=sprintf('%d',i);
text(position(1)+0.2,position(2)+0.2,c,'FontSize',10);
end
