addpath(genpath([pwd, '\\', 'identification' ]))
addpath(genpath([pwd, '\\', 'studied_systems\\enzyme_reaction']))


run_experiment('studied_systems\\enzyme_reaction\\exp1',@u1,@u4)


run_experiment('studied_systems\\enzyme_reaction\\exp2',@u1,@u4)


run_experiment('studied_systems\\enzyme_reaction\\exp3',@u1,@u4)


run_experiment('studied_systems\\enzyme_reaction\\exp4',@u1,@u4)