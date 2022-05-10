function xdot = LotkaVolterraModel(x, params)
    
    alpha = params.alpha;
    beta = params.beta;
    gamma = params.gamma;
    delta = params.delta;
    
    xdot = [alpha*x(1) - beta*x(1)*x(2)
            delta*x(1)*x(2) - gamma*x(2)];

end