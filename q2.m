x=rand(1000,100);
y=rand(500,100);
% event 1 x in range 0 and 50
countevent1x=0;
countevent2x=0;
countevent3x=0;
countevent1y=0;
countevent2y=0;
countevent3y=0;
for i = 1:100
    if( x(i)>0 & x(i)<=330)
        countevent1x=countevent1x+1;
    end
    if( x(i)>330 & x(i)<=660)
        countevent2x=countevent2x+1;
    end
    if( x(i)>660 & x(i)<1000)
        countevent3x=countevent3x+1;
    end
end
for i = 1:100
    if( y(i)>0 & y(i)<=160)
        countevent1y=countevent1y+1;
    end
    if( y(i)>160 & y(i)<=330)
        countevent2y=countevent2y+1;
    end
    if( y(i)>330 & y(i)<500)
        countevent3y=countevent3y+1;
    end
end
X1 = sprintf('Probability of x in range 0 to 330 is %f .',countevent1x/100);
X2 = sprintf('Probability of x in range 330 to 660 is %f .',countevent2x/100);
X3 = sprintf('Probability of x in range 660 to 1000 is %f .',countevent3x/100);
Y1 = sprintf('Probability of y in range 0 to 160 is %f .',countevent1y/100);
Y2 = sprintf('Probability of y in range 160 to 330 is %f .',countevent2y/100);
Y3 = sprintf('Probability of y in range 330 to 500 is %f .',countevent3y/100);
disp(X1);
disp(X2);
disp(X3);
disp(Y1);
disp(Y2);
disp(Y3);
valuesx=[0,330,660,1000];
valuesy=[0,160,330,500];
pd = makedist('Normal');
%subplot(1,2,1);cdfplot(valuesx);axis([-100,1100,-0.1,1.1]); xlabel('X');ylabel('F(X)');title('CDF of X');
%subplot(1,2,2);
cdfplot(valuesy);axis([-100,600,-0.1,1.1]); xlabel('Y');ylabel('F(Y)');title('CDF of Y');
