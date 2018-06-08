function [ coordBlP1,coordBlP2,coordBlP3,coordBlP4 ] = RandBlockage( Len, Wid, numBuilding,areaLen )
% RANDOMBLOCKAGE produce random rectangles and returns 4 corners of random rectangles.
% Note: coordination of the first corner of rectangle is distributed uniformly in [-areLen areaLen]
% and each rectangle has random length and width with expectde value of Len
% and Wid
%%%% Input:
%Len            Expected value of Length of buldings 
%Wid            Expected value of Width of buildings
%numBuilding    number of buildings
%areaLen        Simulation area
%%% Output
%coordBlP1      coordination of the 1st corner of buldings
%coordBlP2      coordination of the 2nd corner of buldings
%coordBlP3      coordination of the 3rd corner of buldings
%coordBlP4      coordination of the 4th corner of buldings

coordBlP1 = zeros (numBuilding,2); coordBlP2 = zeros (numBuilding,2); 
coordBlP3 = zeros (numBuilding,2); coordBlP4 = zeros (numBuilding,2);
% alpha = 2*pi*randi([0,360],numBuilding,1)/180;
for i = 1:numBuilding
    deltaL = randi(Len);
    deltaW = randi(Wid);
%     C = [cos(alpha(i)) -sin(alpha(i));sin(alpha(i)) cos(alpha(i))];
% C=1;
    coordBlP1(i,:) = randi([-areaLen, areaLen], 1, 2);
    coordBlP2(i,1) = coordBlP1(i,1)+ deltaL;
    coordBlP2(i,2) = coordBlP1(i,2);
    coordBlP3(i,1) = coordBlP1(i,1);
    coordBlP3(i,2) = coordBlP1(i,2)+ deltaW;
    coordBlP4(i,1) = coordBlP2(i,1);
    coordBlP4(i,2) = coordBlP2(i,2)+ deltaW;
%     coordBlP2(i,:)=C*([coordBlP2temp(i,1);coordBlP2temp(i,2)]-[coordBlP1(i,1);coordBlP1(i,2)])+[coordBlP1(i,1);coordBlP1(i,2)];
%     coordBlP3(i,:)=C*([coordBlP3temp(i,1);coordBlP3temp(i,2)]-[coordBlP1(i,1);coordBlP1(i,2)])+[coordBlP1(i,1);coordBlP1(i,2)];
%     coordBlP4(i,:)=C*([coordBlP4temp(i,1);coordBlP4temp(i,2)]-[coordBlP1(i,1);coordBlP1(i,2)])+[coordBlP1(i,1);coordBlP1(i,2)];
    
%     hold on;
%     plot([coordBlP1(i,1),coordBlP2(i,1)],[coordBlP1(i,2),coordBlP2(i,2)],'k','LineWidth',1.5)
%     plot([coordBlP2(i,1),coordBlP4(i,1)],[coordBlP2(i,2),coordBlP4(i,2)],'k','LineWidth',1.5)
%     plot([coordBlP4(i,1),coordBlP3(i,1)],[coordBlP4(i,2),coordBlP3(i,2)],'k','LineWidth',1.5)
%     plot([coordBlP3(i,1),coordBlP1(i,1)],[coordBlP3(i,2),coordBlP1(i,2)],'k','LineWidth',1.5)
end
% axis([-areaLen areaLen -areaLen areaLen])

end


