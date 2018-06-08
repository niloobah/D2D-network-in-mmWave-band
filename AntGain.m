function antennaGain = AntGain( xcoord,ycoord,phi,hpBW,G,g )
%ANTGAIN returns total gain of the interference receievd by the reference
%receiever at the origin. Total gain can be {GG,Gg,gg}
%%% ref.(5)[1]

%%% inputs
% xcoord,ycoord   %% interferer's coordination
% phi             %% Antenna main lobe direction
% hpBW            %% Antenna half power beameidth
% G               %% Antenna Main lobe gain
% g               %% Antenna side lobe gain

G1=0; G2=0;
if (xcoord >= 0 && ycoord>= 0)
    if ( ycoord<= xcoord*tan(hpBW) )
        G1=G;
        if (sin(phi)<0 && cos(phi)<0  )
            xIntersecty_0 = xcoord-ycoord/tan(phi+hpBW/2);
            yIntersectx_0 = ycoord-xcoord*tan(phi-hpBW/2);
            if (xIntersecty_0 > 0 && yIntersectx_0 > 0)
                G2=G;
            else
                G1=g;
            end
        else 
            G2=g;
        end
    else
        G1=g;
        if (sin(phi)<0 && cos(phi)<0  )
            %%% find the intersection of line #1 with 
            %%%slope tan(phiUser(i)+hpBW/2) with line y=0:
            xIntersecty_0 = xcoord-ycoord/tan(phi+hpBW/2);
            %%% find the intersection of line #2 with
            %%%slope tan(phiUser(i)-hpBW/2) with line x=0:
            yIntersectx_0 = ycoord-xcoord*tan(phi-hpBW/2);
            if (xIntersecty_0 > 0 && yIntersectx_0 > 0)
                G2=G;
            else
                G2=g;
            end
        else
            G2=g;
        end
    end
    %%% If the interferer is in the second quarter i.e.
            %%% (x<0 && y>0 )
    elseif ( xcoord <=0 && ycoord>0 )
        G1=g;
        if ( cos(phi) > 0 && sin(phi) < 0 )
            yIntersectx_0 = ycoord- xcoord * tan(phi+hpBW/2);
            xIntersecty_0 = xcoord- ycoord/tan(phi-hpBW/2);
            if ( yIntersectx_0 > 0 && xIntersecty_0 <0 )
                G2=G;
            else
                G2=g;
            end
        else
            G2=g;
        end
            %%% 3rd quarter : (x<0 && y<0)
elseif ( xcoord<0 && ycoord<=0 )
    G1=g;
    if ( cos(phi) > 0 && sin(phi) > 0 )
        yIntersectx_0 = ycoord- xcoord * tan(phi-hpBW/2);
        xIntersecty_0 = xcoord- ycoord/tan(phi+hpBW/2);
        if ( yIntersectx_0 < 0 && xIntersecty_0 <0 )
            G2=G;
        else
            G2=g;
        end
     else
         G2=g;
    end
elseif ( xcoord>0 && ycoord<0 )
    G1=g;
    if ( cos(phi) < 0 && sin(phi) > 0 )
        yIntersectx_0 = ycoord- xcoord * tan(phi+hpBW/2);
        xIntersecty_0 = xcoord- ycoord/tan(phi-hpBW/2);
        if ( yIntersectx_0 < 0 && xIntersecty_0 >0 )
            G2=G;
        else
            G2=g;
        end
    else
        G2=g;
    end
end

antennaGain = G1*G2;

end


