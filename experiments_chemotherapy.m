addpath(genpath([pwd, '\\', 'identification' ]))
addpath(genpath([pwd, '\\', 'studied_systems\\model_chemotherapy']))


%run_experiment('studied_systems\\model_chemotherapy\\exp',@free,@u3);

%run_experiment('studied_systems\\model_chemotherapy\\exp1',@free,@u3);

%run_experiment('studied_systems\\model_chemotherapy\\exp2',@u1,@u2);

%run_experiment('studied_systems\\model_chemotherapy\\exp3',@u1,@u2);