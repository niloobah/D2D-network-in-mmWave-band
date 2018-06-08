function outdoor = FindOutdoorUser(Userxcoord, Userycoord, coordBlP1, coordBlP2 , coordBlP3 )
%FINDOUTDOORUSER returns 1 when the user with (Userxcooed,Userycoord) is
%outdoor, otherwise returns zero.
n=0;
outdoor = 1;
for j = 1:size(coordBlP1,1)
    if (Userxcoord>= coordBlP1(j,1) && Userxcoord <= coordBlP2(j,1) )
        if (Userycoord >= coordBlP1(j,2) && Userycoord<= coordBlP3(j,2))
            n=n+1;
            if n>0
                outdoor = 0;
                break
            end
        end
    end
end
% if n>0
%     outdoor = 0;
% else
%     outdoor = 1;
%     plot(Userxcoord,Userycoord,'ro')
end

