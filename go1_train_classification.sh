cd project/Kaggle-UWMGIT
mkdir work_dirs
mkdir work_dirs/tract
chmod 775 tools/dist_train.sh

config="./work_configs/tract/final_solution/classification_configs/cls_1.py"
echo "starting..."
./tools/dist_train.sh $config 2
echo "done for now"

# id=1
# for config in $(find ./work_configs/tract/final_solution/classification_configs/cls*.py | sort); do
# 	./tools/dist_train.sh $config 2
# 	last_work_dir=$(ls ./work_dirs/tract/ -rt | tail -n 1)
# 	last_weight=$(ls ./work_dirs/tract/$last_work_dir/*.pth -rt | tail -n 1)
# 	last_config=$(ls ./work_dirs/tract/$last_work_dir/*.py -rt | tail -n 1)
# 	mv ./work_dirs/tract/$last_work_dir/$last_weight ./saved_weights/cls/cls_${id}.pth
# 	mv ./work_dirs/tract/$last_work_dir/$last_config ./saved_weights/cls/cls_${id}.py
# 	id=$[id+1]

#     echo "done for now"
#     exit
# done
