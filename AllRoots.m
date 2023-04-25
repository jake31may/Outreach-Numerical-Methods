function AllRoots(fun,Method,restarts)

randomStarts = -5 + 10*rand([1,restarts]);
Roots = [];

for i = 1:restarts
    [root,~,iterations] = Method(randomStarts(i),fun);
    
    if iterations == 100
        root = [];
    end
    
    Roots = [Roots,root];
    

end
Roots = unique(round(Roots,4));

x = min(Roots)-1:0.01:max(Roots)+1;

figure()
fig = plot(x,fun(x),LineWidth=1);
hold on
fig = scatter(Roots,zeros([1,length(Roots)]),'r','o','LineWidth',1);
xlabel('x')
ylabel('f(x)')
xline(0)
yline(0)
xlim([min(x),max(x)])
for r = 1:length(Roots)
    datatip(fig,Roots(r)+0.1,-0.5);
end
legend('Function f(x)','Found Roots')
grid on
end