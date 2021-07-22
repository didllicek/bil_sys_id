addpath(genpath([pwd, '\\', 'identification' ]))
addpath(genpath([pwd, '\\', 'studied_systems\\peptide_elongation' ]))



%% default experiment 1
disp('exp0-default setting of the parameters')
%run_experiment('studied_systems\\peptide_elongation\\exp0',@u1,@u2);

%% Other experiments - precision
disp('exp0_1-smaller precision to determine dimension of the system')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1',@u1,@u2);

%% Other experiments - initial condition
disp('different initial condition')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_0',@u1,@u2);

disp('different initial condition and smaller precision')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_0_prec',@u1,@u2);

%% Other experiments - time--step and free decay 
disp('smaller timestep - exp 4')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_1',@u1,@u2);

disp('smaller timestep smaller precision - exp 5')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_1_1',@u1,@u2);

disp('larger timestep - exp 6')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_1_2',@u1,@u2);

disp('larger timestep smaller precision - exp 7')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_1_3',@u1,@u2);


disp('recommended timestep - exp 8')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_3',@u1,@u2);


disp('best results - exp 9')
%run_experiment('studied_systems\\peptide_elongation\\exp0_3_1',@u1,@u2);



%% magnitude of pulses 

disp('exp1-default setting of the parameters')
%run_experiment('studied_systems\\peptide_elongation\\exp0',@u1,@u2);


disp('exp2- W=0.5')
run_experiment('studied_systems\\peptide_elongation\\exp2',@u1,@u2);

%previous setting excitation of larger magnitude
disp('exp3-W=1')
run_experiment('studied_systems\\peptide_elongation\\exp3',@u1,@u2);

%previous setting excitation with higher magnitude
disp('exp4-W=10')
run_experiment('studied_systems\\peptide_elongation\\exp4',@u1,@u2);

%previous setting excitation with higher magnitude
disp('exp4_1W=0.5,1.5,s=2')
run_experiment('studied_systems\\peptide_elongation\\exp4_1',@u1,@u2);

%s=2
%disp('exp5_ s=2,W=0.5,1.5')
%run_experiment('studied_systems\\peptide_elongation\\exp0_3_1_2',@u1,@u2);


%% other experiments - not furher discussed in the thesis
%previous setting different input function for tests
%disp('exp1')
%run_experiment('studied_systems\\peptide_elongation\\exp1',@u3,@u6);

%% other experiments - not furher discussed in the thesis

%disp('exp0_2_1')
%run_experiment('studied_systems\\peptide_elongation\\exp0_2_1',@u1,@u2);


%disp('exp0_2_2')
%run_experiment('studied_systems\\peptide_elongation\\exp0_2_2',@u1,@u2);



%disp('exp0_1_1')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_1',@u1,@u2);


%disp('exp0_1_2')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_2',@u1,@u2);

%disp('exp0_1_4')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_4',@u1,@u2);
%disp('exp0_1_5')
%run_experiment('studied_systems\\peptide_elongation\\exp0_1_5',@u1,@u2);

%previous setting different input function for tests
%disp('exp1')
%run_experiment('studied_systems\\peptide_elongation\\exp1',@u3,@u5);

%previous setting excitation of smaller magnitude
%disp('exp2')
%run_experiment('studied_systems\\peptide_elongation\\exp2',@u1,@u2);

%previous setting excitation of larger magnitude
%disp('exp3')
%run_experiment('studied_systems\\peptide_elongation\\exp3',@u1,@u2);

%previous setting excitation with higher magnitude
%disp('exp4')
%run_experiment('studied_systems\\peptide_elongation\\exp4',@u1,@u2);

%previous setting different initial conditions
%disp('exp5')
%run_experiment('studied_systems\\peptide_elongation\\exp5',@u1,@u2);

%previous setting different initial conditions 
%disp('exp6')
%run_experiment('studied_systems\\peptide_elongation\\exp6',@u1,@u2);


%disp('exp6_1_1')
%run_experiment('studied_systems\\peptide_elongation\\exp6_1_1',@u1,@u2);

%disp('exp6_1_2')
%run_experiment('studied_systems\\peptide_elongation\\exp6_1_2',@u1,@u2);

%previous setting smaller delta t
%disp('exp7')
%run_experiment('studied_systems\\peptide_elongation\\exp7',@u1,@u2)

%previous setting smaller delta t
%disp('exp8')
%run_experiment('studied_systems\\peptide_elongation\\exp8',@u1,@u2)

%disp('exp9')
%run_experiment('studied_systems\\peptide_elongation\\exp9',@u1,@u2)

