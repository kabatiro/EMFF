f = @(x,y) x.*exp(-x.^2-y.^2)+(x.^2+y.^2)/20;%この式を最小化する
fun = @(x) f(x(1),x(2));

g = @(x,y) x.*y/2+(x+2).^2+(y-2).^2/2-2;%非線形不等式制約
gfun = @(x) deal(g(x(1),x(2)),[]);%一個目に非線形不等式制約，二個目に非線形等式制約

fimplicit(g)
axis([-6 0 -1 7])
hold on
fcontour(f)
plot(-.9727,.4685,'ro');
legend('constraint','f contours','minimum');
hold off

x0 = [10, 10];%初期値.lbとubで決める範囲の初期値に設定してても大丈夫ぽい
options = optimoptions('fmincon','Algorithm','interior-point','Display','iter');%内点法ある以後リズムを使用して，反復ごとに結果を示すように設定

A = [];
b = [];
Aeq = [];
Beq = [];
lb = [-6, 4];
ub = [-3, 6];

[x,fval,exitflag,output] = fmincon(fun,x0,A,b,Aeq,Beq,lb,ub,gfun,options);%空いてるところは左から，線形不等式制約2，線形等式制約2，変数の範囲指定2

disp(x)