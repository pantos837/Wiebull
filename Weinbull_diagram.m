%Nines Pantos 



%------------------------------------------------------------------------------------------------------------------------------
format short
clear 
%---------------------------------------------------------------
Weinbull_data                                %This script collects the data asked for the weibull 						        diagram.
%---------------------------------------------------------------

[rows,columns]=size(interval_year);           %Creates a vector with elemnts the number ofa arrays and columms of array interval_speed.
F=((1:rows)'-0.3)./(rows+0.4);
%---------------------------------------------------------------
%Calculate coeficeints C and k with the method of last squares.
X = log(interval_year);               
Y = log(-log(1-F));
z = polyfit(X,Y,1);
B = z(1);
A = z(2);
k = B;                                  %weibull coeficient k.
C = exp(-(A./B))*1e-3;                  %weibull coeficient C.

%---------------------------------------------------------------
%Creates the histogram from usinfg data from interval_speed and fit in
%weibuul distribution.
Weinbull_graph = histfit(interval_speed,30,'weibull');             %Creates and fit the histogram  									       and weinbull distribution.
ylim([0 2000]);                         %y-axes limit
xlim([0 30]);                           %x-axes limit
xlabel('Wind Speed (m/s)');
ylabel ('Probability');
legend('Histogram','Weibull Distribution');
set(Weinbull_graph(1),'facecolor','c');
set(Weinbull_graph(2),'color','b')
%---------------------------------------------------------------
%Name and information about graph.
title(sprintf('Weibull %i -%i',year_1,year_1+4));


dim   = [.15 0 0.0 0.05];                                         %Determine text position (botom left).
dim_2 = [0.7853 0 0 0.05];                                        %Determine text position (botom right).
dim_3 = [0.91 0 0 0.5];                                           %Determine text position (top right)of C.
dim_4 = [0.91 0 0 0.8];                                           %Determine text position (top right)of k.

computer_name = getenv('COMPUTERNAME');  %Gets computer name.
annotation('textbox',dim,'String',computer_name,'FitBoxToText','on');

Name ='Pantos Nines';                                             %Pesonal name that will be 								     dispayed in graph.
annotation('textbox',dim_2,'String',Name,'FitBoxToText','on');

k_str = string(k);                                                %Convert k value to strintg.
k_str ={'k = ' + k_str}; 
annotation('textbox',dim_4,'String',k_str,'FitBoxToText','on');     

C_str = string(C);                                                %Convert C value to strintg.
C_str ={'C = ' + C_str}; 
annotation('textbox',dim_3,'String',C_str,'FitBoxToText','on');
%---------------------------------------------------------------
