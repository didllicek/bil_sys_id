addpath(genpath([pwd, '\\', 'identification' ]))
addpath(genpath([pwd, '\\', 'studied_systems\\tests\\example_juang1']))
addpath(genpath([pwd, '\\', 'studied_systems\\tests\\example_juang2']))
addpath(genpath([pwd, '\\', 'studied_systems\\tests\\semp_example1']))
addpath(genpath([pwd, '\\', 'studied_systems\\tests\\semp_example2']))
addpath(genpath([pwd, '\\', 'studied_systems\\tests\\sontag_constructed']))


%run_experiment('studied_systems\\tests\\example_juang1',@u1,@u2)
%run_experiment('studied_systems\\tests\\example_juang2',@u1,@u2)
run_experiment('studied_systems\\tests\\semp_example1',@u1,@u2)
%run_experiment('studied_systems\\tests\\semp_example2',@u1,@u2)
%run_experiment('studied_systems\\tests\\example_linear1',@u1,@u2)
%run_experiment('studied_systems\\tests\\example_linear2',@u1,@u2)
run_experiment('studied_systems\\tests\\sontag_constructed',@u1,@u2)