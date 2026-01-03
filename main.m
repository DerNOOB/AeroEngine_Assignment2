% Calorific value calculation for SAF approximated as C11H23
clc;
clear;

%% Given data
% Specific heats
Cp_air = 1000;          % J/kg·K  (specific heat of air)
Cp_gas = 1150;          % J/kg·K  (specific heat of combustion gas)

% Specific heat ratios (gamma = kappa)
kappa_air = 1.4;        % for air
kappa_gas = 1.33;       % for combustion gas

% Molar masses (g/mol)
M_C  = 12.00;   % Carbon
M_H  = 1.008;   % Hydrogen
M_O  = 16.00;   % Oxygen
M_N  = 14.01;   % Nitrogen

% Standard enthalpy of formation Δh_f° (kJ/mol)
Hf_H2O_g  = -242.0;    % Water vapor
Hf_H2O_l  = -285.5;    % Liquid water
Hf_CO     = -110.5;    % Carbon monoxide
Hf_CO2    = -393.0;    % Carbon dioxide  
Hf_CH4    = -74.5;     % Methane
Hf_C11H24 = -340.0;    % Undecane (C11H24) 
Hf_fuel = Hf_C11H24;            
% ? 
Hf_O2   = 0;               % O2 (standard state)

% thrust settings
th = [50, 100, 200,300]; % [kN]
p3 = [990, 1700, 3100, 4400]; % [kPa]
T3 = [570, 660, 770, 830]; % [K]
T4 = [1070, 1230, 1440, 1640]; % [K]
m3 = [28, 47, 75, 98]; % [kg/s]

%% Stoichiometric coefficients from balanced equation
nu_fuel = 1;
nu_O2   = 16.75;
nu_CO2  = 11;
nu_H2O  = 11.5;

%% Enthalpy of reaction (combustion)
% ΔH_comb = Σ(n_products * Hf_products) - Σ(n_reactants * Hf_reactants)

H_products  = (nu_CO2 * Hf_CO2) + (nu_H2O * Hf_H2O_g);
H_reactants = (nu_fuel * Hf_fuel) + (nu_O2 * Hf_O2);

DeltaH_comb = H_products - H_reactants;  % kJ/mol fuel

%% Molecular weight of fuel (kg/mol)
MW_fuel = (11 * M_C + 24 * M_H) / 1000;  % kg/mol

%% Calorific value
CV = -DeltaH_comb / MW_fuel;  % kJ/kg

%% Display results
fprintf('Enthalpy of combustion = %.2f kJ/mol\n', DeltaH_comb);
fprintf('Calorific value (HHV)  = %.2f kJ/kg\n', CV);
fprintf('Calorific value (HHV)  = %.2f MJ/kg\n', CV/1000);
