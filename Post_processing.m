clc;
close all;

dt=0.01;
ell=2;
Scheme='M-Scheme';


filename=strcat(Scheme,' $\tau=',num2str(dt),'$, $\ell=',num2str(ell),'$');



EstFlK=importdata('EstFl.txt')';
EstSK=importdata('EstS.txt')';
EstK=importdata('EstK.txt')';
EstQdFlK=importdata('EstQuadFl.txt')';
EstQdSK=importdata('EstQuadS.txt')';
EstOscK=importdata('EstOSc.txt')';


ErrK=importdata('Error.txt');
temp=importdata('ErrLin.txt');

Iter=temp(:,1);
ErrLin=temp(:,2);
ErrTot=temp(:,4);
Eff=temp(:,5);


[Nh,Nt]=size(EstFlK);

EstQdFlK=reshape(EstQdFlK,Nh,[]);
EstQdSK=reshape(EstQdSK,Nh,[]);


EstFl=sqrt(sum(EstFlK.^2));
EstS=sqrt(sum(EstSK.^2));
Est=sqrt(sum(EstK.^2));
EstOsc=sqrt(sum(EstOscK.^2));
EstQdS=sqrt(sum(EstQdSK.^2));
EstQdFl=sqrt(sum(EstQdFlK.^2));

save('data.mat');


figure(1)%%Estimators and error
plot(Iter,log10(ErrTot),'r','LineWidth',2);
hold on
plot(Iter,log10(ErrLin),'o','MarkerSize',5,'MarkerFaceColor','b');
plot(Iter,log10(Est),'g-.','LineWidth',2);
hold off
ylim([-10 0]);
grid on;
legend({'$\vert\kern-0.25ex\|\mathcal{R}(u^i_{\ell})\vert\kern-0.25ex\|_{-1,u^i_{\ell}}$',...
       '$\vert\kern-0.25ex\|u^{i+1}_{\ell}-u^i_{\ell}\vert\kern-0.25ex\|_{1,u^i_{\ell}}$',...
       '$\eta_{\,\!_\Omega}^i$'}, 'Location','SouthWest','FontSize',26,'Interpreter','latex');
set(gca,'FontSize',16,'FontName','New Times Roman');
title(filename,'FontSize',26,'Interpreter','latex');
xlabel('$i$','FontSize',36,'Interpreter','latex','Position',[(max(Iter)-1) -10],...
    'VerticalAlignment','bottom','HorizontalAlignment','center');
ylabel('Errors \& Estimators','FontSize',24,'Interpreter','latex');
saveas(gcf,'Error_vs_Est','fig');
saveas(gcf,'Error_vs_Est','epsc');


figure(2)%%Effectivity
plot(Iter,Eff,'r','LineWidth',2);
ylim([1 2.5]);
grid on;
set(gca,'FontSize',16,'FontName','New Times Roman');
legend({strcat('$\ell=$',num2str(ell))},...
    'Location','SouthWest','FontSize',28,'Interpreter','latex');
xlabel('$i$','FontSize',36,'Interpreter','latex','Position',[(max(Iter)-1) -10],...
    'VerticalAlignment','bottom','HorizontalAlignment','center');
ylabel('Eff. Ind.','FontSize',30,'Interpreter','latex');
saveas(gcf,'Eff_Ind','fig');

figure(3)%%Estimators and error
plot(Iter,log10(EstFl),'g-.','LineWidth',2);
hold on
plot(Iter,log10(EstS),'k','LineWidth',2);
plot(Iter,log10(EstOsc),'b--','LineWidth',1);
plot(Iter,log10(EstQdFl),'-s','MarkerSize',5,'MarkerFaceColor','y');
plot(Iter,log10(EstQdS),'-o','MarkerSize',5,'MarkerFaceColor','m');
hold off
ylim([-10 0]);
grid on;
set(gca,'FontSize',16,'FontName','New Times Roman');
legend({'$\eta_{\mathrm{F},\,\!_\Omega}^i$','$\eta_{\mathrm{S},\,\!_\Omega}^i$','$\eta_{\mathrm{osc},\,\!_\Omega}^i$',...
    '$\eta_{\mathrm{q},\mathrm{F},\,\!_\Omega}^i$','$\eta_{\mathrm{q},\mathrm{S},\,\!_\Omega}^i$'},...
    'Location','SouthEast','FontSize',26,'Interpreter','latex');
title(filename,'FontSize',26,'Interpreter','latex');
xlabel('$i$','FontSize',36,'Interpreter','latex','Position',[(max(Iter)-1) -10],...
    'VerticalAlignment','bottom','HorizontalAlignment','center');
ylabel('Estimators','FontSize',30,'Interpreter','latex');
saveas(gcf,'Estimators','fig');
saveas(gcf,'Estimators','epsc');
