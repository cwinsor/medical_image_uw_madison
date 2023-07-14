setup of Conda enviroment for UW-Madison Kaggle
The environment is UBUNTU / WSL ...

https://www.kaggle.com/competitions/uw-madison-gi-tract-image-segmentation/discussion/323921

The "end-to-end" example is an excellent starting point for MMsegmentation in medical imaging.

The task here is to set up conda environment that works...
The example gives a .requirements (pip) file - but here we use conda...


start with a clean/fresh/new conda environment 
conda create --name myenv

Install torch with CUDA - note that CUDA drivers are assumed installed/running in the
underlying Windows environment - the version specified here needs to match that, but NO need
TO REINSTALL CUDA under Ubuntu.
Use the command specified at https://pytorch.org/get-started/locally/#linux-anaconda
my versions were Torch 2.0.1, Linux, Conda, CUDA 11.5
the command was:
    conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia

OpenCV requires some dorking...
 2094  conda install -c conda-forge opencv-python
 2095  conda install -c conda-forge opencv
(this gave opencv 4.6.0 - unclear whether both are necessary...)
 2077  conda install -c conda-forge  albumentations==1.0.3
 2086  conda install -c conda-forge numpy
(this gave numpy 1.22.3)
 2088  conda install -c conda-forge pandas
 2092  conda install -c conda-forge tqdm
 2093  conda list
 2094  conda install -c conda-forge opencv-python
 2095  conda install -c conda-forge opencv
 2126  conda install -c conda-forge scikit-learn
 2222  conda install -c esri mmcv-full

(At that point I was having a problem with "import cv2" - the first import in the VS-Code IDE - this
turned out to be the python interpreter was pointing to the wrong Conda folder...
so in VS-Code -> View Command Palette -> Python: Select Interpreter)

above allows me to run the " "
then extract portion of readme.md into a script "go1_train1_classification.sh"

This fails lacking mmcv. 
following instructions at https://mmcv.readthedocs.io/en/latest/get_started/installation.html
$ pip install mmcv==2.0.0 -f https://download.openmmlab.com/mmcv/dist/cu117/torch2.0/index.html
gives... 
Successfully installed mmcv-2.0.0

this fails...
from mmcv.cnn.utils import revert_sync_batchnorm
ImportError: cannot import name 'revert_sync_batchnorm' from 'mmcv.cnn.utils' (/home/chris/anaconda3/envs/pytorch_h_cv2_u_madison/lib/python3.9/site-packages/mmcv/cnn/utils/__init__.py)

referring to https://mmcv.readthedocs.io/en/latest/get_started/installation.html

we have a problem...
(pytorch_h_cv2_u_madison) $ python -c 'import torch;print(torch.__version__);print(torch.version.cuda)'
2.0.1
None <-------- WTF




xxxxxxxxxxxxxxx
Best way to deal with this is to git clone the repo and 
add to PYTHONPATH a link:
mmcv...
https://mmcv.readthedocs.io/en/latest/get_started/installation.html
https://mmcv-jm.readthedocs.io/en/latest/#
 2015  git clone https://github.com/open-mmlab/mmcv.git
 2016  cd mmcv/
 2037  pwd
 2038  export PYTHONPATH=/mnt/d/code_medimg_kag_uw_madison/Kaggle-UWMGIT/mmcv
 2040  ./go1_train_classification.sh

 this fails lacking "mmengine"
from mmengine.utils import to_2tuple
ModuleNotFoundError: No module named 'mmengine'
 2103  pip install mmengine

this fails 
ImportError: cannot import name 'revert_sync_batchnorm' from 'mmcv.cnn.utils' (/mnt/d/code_medimg_kag_uw_madison/Kaggle-UWMGIT/mmcv/mmcv/cnn/utils/__init__.py)
    from mmcv.cnn.utils import revert_sync_batchnorm
ImportError: cannot import name 'revert_sync_batchnorm' from 'mmcv.cnn.utils' 

 2038  export PYTHONPATH=/mnt/d/code_medimg_kag_uw_madison/Kaggle-UWMGIT/mmcv
 and re-run "vs-code"