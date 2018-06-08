function blockedLink = IsBlocked( UserCoord, coordBlP1,coordBlP2,coordBlP3,coordBlP4 )
%BLOCKAGE returns 1 if the link probe(reference reciever) and the
%interferer is blocked, otherwise return 0;
%%% input:
%UserCoord      (xcoord,ycoord): Cordination of the interferer
%coordBlP1      coordination of the 1st corner of buldings
%coordBlP2      coordination of the 2nd corner of buldings
%coordBlP3      coordination of the 3rd corner of buldings
%coordBlP4      coordination of the 4th corner of buldings
%%% output:
% blockedLink   1 if the link is blocked, 0 is the link is not blockde

probe = [0,0]; %% Future expanssion mobile reference
n=0;
blockedLink =0;
for j = 1:size(coordBlP1,1)
    if ( Intersect1(probe,UserCoord,coordBlP1(j,:),coordBlP2(j,:)) ||...
            Intersect1(probe, UserCoord, coordBlP2(j,:), coordBlP4(j,:)) ||...
            Intersect1(probe,UserCoord,coordBlP4(j,:),coordBlP3(j,:)) || ...
            Intersect1(probe,UserCoord,coordBlP3(j,:),coordBlP1(j,:)))
        n=n+1;
        if n>0
            blockedLink = 1;
%             plot([probe(1),UserCoord(1)],[probe(2),UserCoord(2)],'r')
            break
        end
    end
end
% if n>0
%     blockedLink = 1;
%     plot([probe(1),UserCoord(1)],[probe(2),UserCoord(2)],'r')
% else
%     blockedLink = 0;
% end

end

