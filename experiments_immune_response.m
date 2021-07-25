addpath(genpath([pwd, '\\', 'identification' ]))
addpath(genpath([pwd, '\\', 'studied_systems\\immune_response']))


disp('Experiment p=2')
run_experiment('studied_systems\\immune_response\\exp_C_obs',@u2,@free)
disp('Experiment p=3')
run_experiment('studied_systems\\immune_response\\exp_C_obsp=3',@u2,@free)


%% controllability problems computations
%sys_spec=read_sys('studied_systems\\immune_response\\exp_C_obs'); 
%sys_spec=read_sys('studied_systems\\immune_response\\exp_all_states'); 
%C=sys_spec.C;
%A=sys_spec.Ac;
%N=sys_spec.Ncs(:,:,1);
%Ob=[C;C*A;C*N;C*A^2;C*N^2;C*A*N;C*N*A]
%rank(Ob)
%[U,S,V]=svd(Ob);
%min(diag(S))/max(diag(S))
%max(diag(S));
%diag(S);
%rank(expm(A)/2)
%rank(obsv(A,C));
%pause;

%% other studied experimenty
%disp('1')
%run_experiment('studied_systems\\immune_response\\exp_all_statesp=3',@u2,@u6)
%pause
%disp('2')
%run_experiment('studied_systems\\immune_response\\exp_all_statess=2',@u2,@u6)
%pause
%disp('3')
%run_experiment('studied_systems\\immune_response\\exp_all_states _smaller_free_decay',@u2,@u6)
%pause
%disp('5')
%run_experiment('studied_systems\\immune_response\\exp_C_unobs',@u2,@u6)
%pause
%disp('6')

%run_experiment('studied_systems\\immune_response\\exp_C_unobs_smallDeltaT',@u2,@u6)
%pause
%disp('7')
%run_experiment('studied_systems\\immune_response\\exp3',@u2,@u6)

%run_experiment('studied_systems\\immune_response\\exp_all_states_obs_setting',@u2,@u1)
