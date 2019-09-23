# batModel
Battery modeling from Manufacturer's data and genetic algorithm. 

Battery Equivalent Circuit model for Kokam battery
battery parameters, V, R, C, OCV are expressed as the non-linear function of SoC, C-rate, Temperature and number of cells.
function parameters are found from the manufacturer's datasheet using Genetic Algorithm.

check Data folder, for different characteristic curves for particular battery provided in manufacturer's datasheet.

Files : 
1. one_cycle_kokam_*** - to simulate one cycle of charge/discharge in Kokam battery.
2. V_el_T - Equivalent electrical circuit contains R_in, R_in_2, C_in. where internal resistance and Capacitance is algebric function of SoC, C-rate and Temperature and number of cells in battery. OCV is calculated   
Peukert capacity is calculated to in the process. 
3. open_circuit_voltage_LA_** - calculates the open circuit voltage based on SoC, C-rate, Temperature and number of cells.

The form of algebric dependancies in the function is chosen from literature. 
by coloumb counting, DoD is calculated.

4. GA_main_** - the error between simulated results and data from manufacturer's sheet is calculated are passed in GA to optimize the parameters. 

for sake of simplicity, for different C-rates, different code are maintained, it could have been done with single file also. 
final results are further optimized with fmin function. 
from the optimized values for different C-rates and temperatures, the gloabl optimization algorithm is run to optimize and to get global optimized parameters which works for all C-rates and temperatures. 

Future scope- 
1. to include aging results
2. to match results with electrochemical models
3. To include more electrical elements for better understanding of battery processes,ex double layer capacitance, SEI layer formation, etc
4. to improve the electrical circuit, to include EIS experimental results.

Disclaimer : this project is done for sole purpose of basic understanding of battery equivalent electrical circuit modeling. It is not being used commercially. 
