function [map,num] = tab20c(N)
% Qualitative colormap from MatPlotLib, for plots using the line ColorOrder.
% In MatPlotLib 2 it is named VEGA20C, for MatPlotLib 3 was renamed TAB20C.
%
% Copyright (c) 2017-2022 Stephen Cobeldick
%
%%% Syntax:
%  map = tab20c
%  map = tab20c(N)
%
% For MatPlotLib 2.0 improved colormaps were created for plot lines of
% categorical data. The new colormaps are introduced here:
% <http://matplotlib.org/2.0.0rc2/users/dflt_style_changes.html>
% VEGA10/TAB10 is the default Line Color Order for MatPlotLib 2 and 3.
%
% MATLAB axes ColorOrder (note that this is NOT the axes COLORMAP):
% <https://www.mathworks.com/help/matlab/creating_plots/defining-the-color-of-lines-for-plotting.html>
% <https://www.mathworks.com/help/matlab/graphics_transition/why-are-plot-lines-different-colors.html>
%
%% Examples %%
%
%%% PLOT using matrices:
% N = 20;
% axes('ColorOrder',tab20c(N),'NextPlot','replacechildren')
% X = linspace(0,pi*3,1000);
% Y = bsxfun(@(x,n)sqrt(n)*sin(x+2*n*pi/N), X(:), 1:N);
% plot(X,Y, 'linewidth',4)
%
%%% PLOT in a loop:
% N = 20;
% set(0,'DefaultAxesColorOrder',tab20c(N))
% X = linspace(0,pi*3,1000);
% Y = bsxfun(@(x,n)sqrt(n)*sin(x+2*n*pi/N), X(:), 1:N);
% for n = 1:N
%     plot(X(:),Y(:,n), 'linewidth',4);
%     hold all
% end
%
%%% LINE using matrices:
% N = 20;
% set(0,'DefaultAxesColorOrder',tab20c(N))
% X = linspace(0,pi*3,1000);
% Y = bsxfun(@(x,n)sqrt(n)*cos(x+2*n*pi/N), X(:), 1:N);
% line(X(:),Y)
%
%% Input and Output Arguments %%
%
%%% Inputs (**=default):
% N = NumericScalar, N>=0, an integer to define the colormap length.
%   = []**, same length as MATLAB's inbuilt colormap functions.
%
%%% Outputs:
% map = NumericMatrix, size Nx3, a colormap of RGB values between 0 and 1.
%
% See also TAB10 TAB20 TAB20B
% CIVIDIS INFERNO MAGMA PLASMA TWILIGHT TWILIGHT_SHIFTED VIRIDIS
% BREWER CRAMERI CUBEHELIX LINES PARULA COLORMAP SET

if nargin<1 || isnumeric(N)&&isequal(N,[])
	N = cmDefaultN();
else
	assert(isscalar(N)&&isfinite(N)&&isreal(N),...
		'SC:tab20c:N:NotRealFiniteScalarNumeric',...
		'First argument <N> must be a real finite numeric scalar.')
end
%
hex = ['#3182bd';'#6baed6';'#9ecae1';'#c6dbef';'#e6550d';'#fd8d3c';'#fdae6b';'#fdd0a2';'#31a354';'#74c476';'#a1d99b';'#c7e9c0';'#756bb1';'#9e9ac8';'#bcbddc';'#dadaeb';'#636363';'#969696';'#bdbdbd';'#d9d9d9'];
raw = sscanf(hex.','#%2x%2x%2x',[3,Inf]).';
num = size(raw,1);
%
map = raw(1+mod(0:N-1,num),:) / 255;
%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%tab20c

