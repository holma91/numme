
function [] = upg2a ()
    f = @(x) x.^2 - 2*sin(3*x+1) - 2;
    %{
    Genom test av stort intervall på x ser vi att 
    funktionen är strängt växande och endast har
    nollställen för små x
    %}
    x = -5:0.01:5;
    
    %{
    Genom att titta på grafen ser vi att alla 
    4 nollpunkter för f(x) befinner sig mellan 
    x=-3 och x=1
    %}
    
    plot(x, f(x))



