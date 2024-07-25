% initiates parameters for all sensors and actuators in use
% this file works together with reginit.m

% actuator limitations
% aeration equipment capacity (also used by controller for anti-winup)
KLa1_max = 360; %maximum possible KLa value to reactor1
KLa2_max = 240; %maximum possible KLa value to reactor2
KLa3_max = 240; %maximum possible KLa value to reactor3
KLa4_max = 240; %maximum possible KLa value to reactor4

KLa5_max = 360; %maximum possible KLa value to reactor5
KLa6_max = 240; %maximum possible KLa value to reactor6
KLa7_max = 240; %maximum possible KLa value to reactor7
KLa8_max = 240; %maximum possible KLa value to reactor8

% external carbon flow addition capacity (also used by controller for anti-winup)
carb1_max = 5; %maximum possible external carbon flow rate to reactor1
carb2_max = 5; %maximum possible external carbon flow rate to reactor2
carb3_max = 5; %maximum possible external carbon flow rate to reactor3
carb4_max = 5; %maximum possible external carbon flow rate to reactor4

carb5_max = 5; %maximum possible external carbon flow rate to reactor5
carb6_max = 5; %maximum possible external carbon flow rate to reactor6
carb7_max = 5; %maximum possible external carbon flow rate to reactor7
carb8_max = 5; %maximum possible external carbon flow rate to reactor8

% pumping equipment capacity NEW line (also used by controllers for anti-windup)
Qintr_max_new = 5*Qin0; %maximum pump capacity for Qintr (= 92230 m3/d)
Qw_max_new = 0.1*Qin0; %maximum pump capacity for Qw (= 1844.6 m3/d)
Qr_max_new = 2*Qin0; %maximum pump capacity for Qr (= 36892 m3/d)

% pumping equipment capacity NEW line (also used by controllers for anti-windup)
Qintr_max_old = 5*Qin0; %maximum pump capacity for Qintr (= 92230 m3/d)
Qw_max_old = 0.1*Qin0; %maximum pump capacity for Qw (= 1844.6 m3/d)
Qr_max_old = 2*Qin0; %maximum pump capacity for Qr (= 36892 m3/d)

% actuator definitions BSM1 default strategy
% KLa5 actuator, according to BSM definition, T90=4 min, n=2
T90_KLa5 = 4; %minutes
T_KLa5 = T90_KLa5/(24*60)/3.89;
useideal_KLa5 = 1; %select ideal actuator or not (0=non-ideal, 1=ideal (for testing)) for KLa5
useideal_KLa5_old = 1; %select ideal actuator or not (0=non-ideal, 1=ideal (for testing)) for KLa5

%sensor definitions BSM1 deafult strategy
% DO sensor NEW line, according to BSM definition (class A), T90=1 min, n=2
min_SO2 = 0; %lower measurement limit, mg/l
max_SO2 = 10; %upper measurement limit, mg/l
T90_SO2 = 1; %response time in minutes
T_SO2 = T90_SO2/(24*60)/3.89;
std_SO2 = 0.025; %standard deviation of noise
NOISEDATA_SO2 = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SO2 = 1; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SO2 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SO2 = 1; %select noise or not (0=no noise, 1=use noise) for DO sensor
useideal_SO2 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for DO sensor, overrides usenoise_SO2

% DO sensor NEW line, according to BSM definition (class A), T90=1 min, n=2
min_SO3 = 0; %lower measurement limit, mg/l
max_SO3 = 10; %upper measurement limit, mg/l
T90_SO3 = 1; %response time in minutes
T_SO3 = T90_SO3/(24*60)/3.89;
std_SO3 = 0.025; %standard deviation of noise
NOISEDATA_SO3 = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SO3 = 1; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SO3 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SO3 = 1; %select noise or not (0=no noise, 1=use noise) for DO sensor
useideal_SO3 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for DO sensor, overrides usenoise_SO3

% DO sensor NEW line, according to BSM definition (class A), T90=1 min, n=2
min_SO4 = 0; %lower measurement limit, mg/l
max_SO4 = 10; %upper measurement limit, mg/l
T90_SO4 = 1; %response time in minutes
T_SO4 = T90_SO4/(24*60)/3.89;
std_SO4 = 0.025; %standard deviation of noise
NOISEDATA_SO4 = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SO4 = 1; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SO4 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SO4 = 1; %select noise or not (0=no noise, 1=use noise) for DO sensor
useideal_SO4 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for DO sensor, overrides usenoise_SO4

% DO sensor NEW line, according to BSM definition (class A), T90=1 min, n=2
min_SO6 = 0; %lower measurement limit, mg/l
max_SO6 = 10; %upper measurement limit, mg/l
T90_SO6 = 1; %response time in minutes
T_SO6 = T90_SO6/(24*60)/3.89;
std_SO6 = 0.025; %standard deviation of noise
NOISEDATA_SO6 = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SO6 = 1; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SO6 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SO6 = 1; %select noise or not (0=no noise, 1=use noise) for DO sensor
useideal_SO6 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for DO sensor, overrides usenoise_SO6

% DO sensor NEW line, according to BSM definition (class A), T90=1 min, n=2
min_SO7 = 0; %lower measurement limit, mg/l
max_SO7 = 10; %upper measurement limit, mg/l
T90_SO7 = 1; %response time in minutes
T_SO7 = T90_SO7/(24*60)/3.89;
std_SO7 = 0.025; %standard deviation of noise
NOISEDATA_SO7 = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SO7 = 1; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SO7 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SO7 = 1; %select noise or not (0=no noise, 1=use noise) for DO sensor
useideal_SO7 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for DO sensor, overrides usenoise_SO7

% DO sensor OLD line, according to BSM definition (class A), T90=1 min, n=2
min_SO8 = 0; %lower measurement limit, mg/l
max_SO8 = 10; %upper measurement limit, mg/l
T90_SO8 = 1; %response time in minutes
T_SO8 = T90_SO8/(24*60)/3.89;
std_SO8 = 0.025; %standard deviation of noise
NOISEDATA_SO8 = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SO8 = 1; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SO8 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SO8 = 1; %select noise or not (0=no noise, 1=use noise) for DO sensor
useideal_SO8 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for DO sensor, overrides usenoise_SO8

% SNO sensor NEW line, according to BSM definition (class B0), T90=10 min, n=8
min_SNO1 = 0; %lower measurement limit, 0 mg N/l
max_SNO1 = 20; %upper measurement limit, 20 mg N/l
T90_SNO1 = 10; %response time in minutes
T_SNO1 = T90_SNO1/(24*60)/11.7724;
std_SNO1 = 0.025; %standard deviation of noise
NOISEDATA_SNO1 = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SNO1 = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SNO1 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SNO1 = 1; %select noise or not (0=no noise, 1=use noise) for SNO sensor
useideal_SNO1 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for SNO sensor, overrides usenoise_SNO1

% SNO sensor OLD line, according to BSM definition (class B0), T90=10 min, n=8
min_SNO4 = 0; %lower measurement limit, 0 mg N/l
max_SNO4 = 20; %upper measurement limit, 20 mg N/l
T90_SNO4 = 10; %response time in minutes
T_SNO4 = T90_SNO4/(24*60)/11.7724;
std_SNO4 = 0.025; %standard deviation of noise
NOISEDATA_SNO4 = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SNO4 = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SNO4 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SNO4 = 1; %select noise or not (0=no noise, 1=use noise) for SNO sensor
useideal_SNO4 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for SNO sensor, overrides usenoise_SNO4

% SNO sensor NEW line, according to BSM definition (class B0), T90=10 min, n=8
min_SNO5 = 0; %lower measurement limit, 0 mg N/l
max_SNO5 = 20; %upper measurement limit, 20 mg N/l
T90_SNO5 = 10; %response time in minutes
T_SNO5 = T90_SNO5/(24*60)/11.7724;
std_SNO5 = 0.025; %standard deviation of noise
NOISEDATA_SNO5 = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SNO5 = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SNO5 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SNO5 = 1; %select noise or not (0=no noise, 1=use noise) for SNO sensor
useideal_SNO5 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for SNO sensor, overrides usenoise_SNO1

% SNO sensor OLD line, according to BSM definition (class B0), T90=10 min, n=8
min_SNO8 = 0; %lower measurement limit, 0 mg N/l
max_SNO8 = 20; %upper measurement limit, 20 mg N/l
T90_SNO8 = 10; %response time in minutes
T_SNO8 = T90_SNO8/(24*60)/11.7724;
std_SNO8 = 0.025; %standard deviation of noise
NOISEDATA_SNO8 = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use, column 1 = time
noiseseed_SNO8 = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SNO8 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SNO8 = 1; %select noise or not (0=no noise, 1=use noise) for SNO sensor
useideal_SNO8 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal (for testing)) for SNO sensor, overrides usenoise_SNO4

% for B0 class sensors use simulink model sensor B0, and change XXX in file and simulink
min_SNH4 = 0; %lower measurement limit
max_SNH4 = 20; %upper measurement limit
T90_SNH4 = 10; %response time minutes
T_SNH4 = T90_SNH4/(24*60)/11.7724;
std_SNH4 = 0.025; %standard deviation of noise
NOISEDATA_SNH4 = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
noiseseed_SNH4 = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SNH4 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SNH4 = 1; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_SNH4 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for B0 class sensors use simulink model sensor B0, and change XXX in file and simulink
min_SNH8 = 0; %lower measurement limit
max_SNH8 = 20; %upper measurement limit
T90_SNH8 = 10; %response time minutes
T_SNH8 = T90_SNH8/(24*60)/11.7724;
std_SNH8 = 0.025; %standard deviation of noise
NOISEDATA_SNH8 = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
noiseseed_SNH8 = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SNH8 = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SNH8 = 1; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_SNH8 = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for D class sensors use simulink model sensor D, and change XXX in file and simulink
min_CODin = 85; %lower measurement limit
max_CODin = 1500; %upper measurement limit
T0_CODin = 45/(24*60); %sample time (minutes = 45)
std_CODin = 0.025; %standard deviation of noise 0.025
NOISEDATA_CODin = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
noiseseed_CODin = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_CODin = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_CODin = 1; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_CODin = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for B0 class sensors use simulink model sensor B0, and change XXX in file and simulink
min_SNHin = 0; %lower measurement limit
max_SNHin = 50; %upper measurement limit
T90_SNHin = 10; %response time minutes
T_SNHin = T90_SNHin/(24*60)/11.7724;
std_SNHin = 0.025; %standard deviation of noise
NOISEDATA_SNHin = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
noiseseed_SNHin = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_SNHin = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_SNHin = 1; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_SNHin = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for A class sensors use simulink model sensor A, and change XXX in file and simulink
min_Qin = 0; %lower measurement limit
max_Qin = 50000; %upper measurement limit
T90_Qin = 1; %respose time minutes
T_Qin = T90_Qin/(24*60)/3.89;
std_Qin = 0.025; %standard deviation of noise
NOISEDATA_Qin = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use
noiseseed_Qin = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
noisesource_Qin = 1; %select noise source: 0=random generator, 1=predefined noisefile
usenoise_Qin = 1; %select noise or not (0=no noise, 1=use noise) for sensor
useideal_Qin = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for a KLa actuator use simulink model KLa_actuator, and change XXX in file and simulink
% T90_XXX = 4; %minutes
% T_XXX = T90_XXX/(24*60)/3.89;
% useideal_XXX = 0; %select ideal actuator or not (0=non-ideal, 1=ideal)

% for A class sensors use simulink model sensor A, and change XXX in file and simulink
% min_XXX = ?; %lower measurement limit
% max_XXX = ?; %upper measurement limit
% T90_XXX = 1; %respose time minutes
% T_XXX = T90_XXX/(24*60)/3.89;
% std_XXX = 0.025; %standard deviation of noise
% NOISEDATA_XXX = SENSORNOISE(:, [1 2]); %define which column in SENSORNOISE to use
% noiseseed_XXX = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
% noisesource_XXX = 1; %select noise source: 0=random generator, 1=predefined noisefile
% usenoise_XXX = 1; %select noise or not (0=no noise, 1=use noise) for sensor
% useideal_XXX = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for B0 class sensors use simulink model sensor B0, and change XXX in file and simulink
% min_XXX = ?; %lower measurement limit
% max_XXX = ?; %upper measurement limit
% T90_XXX = 10; %response time minutes
% T_XXX = T90_XXX/(24*60)/11.7724;
% std_XXX = 0.025; %standard deviation of noise
% NOISEDATA_XXX = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
% noiseseed_XXX = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
% noisesource_XXX = 1; %select noise source: 0=random generator, 1=predefined noisefile
% usenoise_XXX = 1; %select noise or not (0=no noise, 1=use noise) for sensor
% useideal_XXX = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for C0 class sensors use simulink model sensor C0, and change XXX in file and simulink
% min_XXX = ?; %lower measurement limit
% max_XXX = ?; %upper measurement limit
% T90_XXX = 20; %response time minutes
% T_XXX = T90_XXX/(24*60)/11.7724;
% std_XXX = 0.025; %standard deviation of noise
% NOISEDATA_XXX = SENSORNOISE(:, [1 4]); %define which column in SENSORNOISE to use
% noiseseed_XXX = 3; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
% noisesource_XXX = 1; %select noise source: 0=random generator, 1=predefined noisefile
% usenoise_XXX = 1; %select noise or not (0=no noise, 1=use noise) for sensor
% useideal_XXX = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for B1 class sensors use simulink model sensor B1, and change XXX in file and simulink
% min_XXX = ?; %lower measurement limit
% max_XXX = ?; %upper measurement limit
% T90_XXX = 10; %response time minutes
% T_XXX = T90_XXX/(24*60)/11.7724;
% T0_XXX = 5/(24*60); %sample time (minutes = 5)
% std_XXX = 0.025; %standard deviation of noise
% NOISEDATA_XXX = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
% noiseseed_XXX = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
% noisesource_XXX = 1; %select noise source: 0=random generator, 1=predefined noisefile
% usenoise_XXX = 1; %select noise or not (0=no noise, 1=use noise) for sensor
% useideal_XXX = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for C1 class sensors use simulink model sensor C1, and change XXX in file and simulink
% min_XXX = ?; %lower measurement limit
% max_XXX = ?; %upper measurement limit
% T90_XXX = 20; %response time minutes
% T_XXX = T90_XXX/(24*60)/11.7724;
% T0_XXX = 5/(24*60); %sample time (minutes = 5)
% std_XXX = 0.025; %standard deviation of noise
% NOISEDATA_XXX = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
% noiseseed_XXX = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
% noisesource_XXX = 1; %select noise source: 0=random generator, 1=predefined noisefile
% usenoise_XXX = 1; %select noise or not (0=no noise, 1=use noise) for sensor
% useideal_XXX = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for sensor

% for D class sensors use simulink model sensor D, and change XXX in file and simulink
% min_XXX = ?; %lower measurement limit
% max_XXX = ?; %upper measurement limit
% T0_XXX = 30/(24*60); %sample time (minutes = 30)
% std_XXX = 0.025; %standard deviation of noise
% NOISEDATA_XXX = SENSORNOISE(:, [1 3]); %define which column in SENSORNOISE to use
% noiseseed_XXX = 2; %noise seed for random generator (mean=0, std=1, sample=1 per minute)
% noisesource_XXX = 1; %select noise source: 0=random generator, 1=predefined noisefile
% usenoise_XXX = 1; %select noise or not (0=no noise, 1=use noise) for sensor
% useideal_XXX = 0; %select ideal sensor or not (0=non-ideal, 1=ideal) for
% sensor

