[x,t] = simplefit_dataset;
net = fitnet(10);
net = train(net,x,t);
y = net(x);
perf = perform(net,t, y)

%{
net1 = fitnet(10);
net1 = train(net1,x(1:40),t(1:40));

y11 = net1(x(1:40));
perf11 = perform(net1,t(1:40), y11)

net2 = train(net1,x(41:end),t(41:end));

y1 = net2(x(1:40));
perf1 = perform(net2,t(1:40), y1)

y2 = net2(x(41:end));
perf2 = perform(net2,t(41:end), y2)

y3 = net2(x);
perf3 = perform(net2,t, y3)


net22 = fitnet(10);
net22 = train(net22,x(41:end),t(41:end));

y22 = net22(x(41:end));
perf22 = perform(net22,t(41:end), y22)

%}

net33 = fitnet(10);
net33 = train(net33,x(1:40),t(1:40));
net33 = train(net33,x(41:end),t(41:end));
y331 = net33(x(1:40));
perf331 = perform(net33,t(1:40), y331)

y332 = net33(x(41:end));
perf332 = perform(net33,t(41:end), y332)

y333 = net33(x);
perf333 = perform(net33,t, y333)


