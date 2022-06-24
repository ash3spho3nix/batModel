### Charging time calculation
##### Audi etron GT car with 396 LG E66A cells

[AUDI etron Battery pack]
(https://media.electrichasgoneaudi.net/multimedia/models/e-tron-gt/drivetrain/battery/battery3s.jpg)

Types of chargers added :
1. Type 1 AC - 5kW AC
2. Type 2 AC - 22kW AC
3. Type 1 DC - 150 kW DC
4. Type 2 DC - 270 kW DC

charging current limits from external charger, bms current limits, cell current limits are considered, to find the charging current.
SOC is calculated by coloumb counting, with charging efficiency included. 
Assumptions :
1. Charging takes place between 20 C and 45 C. Cooling or heating system will precondition the battery to optimal temperature.
2. Battery heat generation is not taken into account. An additional heat generation will be added in the equation. charging time will increase based on cooling power.

BMS ensures the CCCV charging strategy. Temperature dependance is introduced. 

Future scope :
1. including SOH in charging time calculation
2. multi-step CCCV strategy
3. Other vehicle models and cell types to be included

External Links:
1. https://www.evexpert.eu/eshop1/knowledge-center/on-board-charger
2. https://www.batemo.de/products/batemo-cell-library/e66a/
3. https://doi.org/10.1049/pel2.12219 (Charging control strategies for lithium-ion battery packs: Review and recent developments)
4. https://electronics.stackexchange.com/questions/568037/using-constant-current-and-constant-voltage-charging-to-fully-charge-a-battery
5. https://electrek.co/2021/10/22/electric-vehicle-ev-charging-standards-and-how-they-differ/
6. https://www.saftbatteries.com/energizing-iot/charging-your-lithium-ion-batteries-5-expert-tips-longer-lifespan
7. https://www.engineersedge.com/battery/constant_current_charging.htm

Audi etrom GT configuration
https://electrichasgoneaudi.net/models/e-tron-gt/drivetrain/battery/