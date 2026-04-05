function summaries = run_all_tasks()
%RUN_ALL_TASKS Execute all standardized experiment tasks in sequence.

script_dir = fileparts(mfilename('fullpath'));
project_root = fileparts(script_dir);

addpath(script_dir);
addpath(fullfile(project_root, 'src'));

fprintf('开始运行全部实验任务...\n');

summaries = struct();
summaries.task1 = task1_wichmann_hill_uniform();
summaries.task2 = task2_rayleigh_inverse_transform();
summaries.task3 = task3_gaussian_box_muller();
summaries.task4 = task4_discrete_random_variable();

fprintf('全部任务运行完成，图像已输出到 results/figures 目录。\n');
end
