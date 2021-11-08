
%% Exercise 4.4: Find an appropriate time step; logistic model
%%% Extension of logistic.m found on page 99

clear;clc;close;

dt = 20;
T = 80;
f = @(u,t) 0.1*(1-u/500)*u;

U_0 = 100;

[u, t] = ode_FE(f, U_0, dt, T);

k = 1;
while true
    dt_k = 2^(-k)*dt;
    [u_current, t_current] = ode_FE(f, U_0, dt_k, T);
    graph_result(t,u,t_current,u_current, dt_k);
    fprintf("Previous timestep was: %0.3f \n", dt_k)
    if (strcmp(input("Continue with a higher dt value [y/n]? ",'s'),'y'))
       u = u_current;
       t = t_current;
       k = k + 1;
    else 
        break; % The interval is okay so we're stopping the loop
    end

end

%% Utility Graphing Function
function graph_result(t,u,t_current, u_current,dt_k)
    plot(t,u,'k',t_current,u_current,'r--')
    legend('previous','current','Location','southeast')
    xlabel('t');
    ylabel('N(t)');
    saveas(gcf,sprintf("output_logistic_dt_%d.png",dt_k))
end

    