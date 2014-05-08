# Packaging
To package caqtdm for SL5 and SL6 following steps are needed

 * Clone caqtdm sources

```
git clone https://github.psi.ch/scm/qtdm/caqtdm_project.git
```

 * Build caqtdm binaries for architecture

```
export PATH=/usr/lib64/qt4/bin:$PATH
export QWTHOME=/usr/local/qwt-6.0.1/features
export QWTINCLUDE=/usr/local/qwt-6.0.1/include
export QWTLIB=/usr/local/qwt-6.0.1/lib

./caQtDM_BuildAll
```

To build the package qwt-6.0.1 and epics base is required (adapt the paths above if required).

 * After caqtdm is build run the packaging script

```
./makePackage.sh
```

This will create a ~/caqtdm_package folder in which the content of the package is located. This content
can further on be packaged via rpm or some other package format.

## Info
The caqtdm package (created by the package script) is supposed to be installed in `/usr/caqtdm`

To build the package for different linux architectures use following servers:
 * SL6 64Bit gfalcd.psi.ch
 * SL6 32Bit gfalc6032.psi.ch
 * SL5 32Bit gfalc5732.psi.ch

# Usage
Once the caqtdm binaries are installed in `/usr/caqtdm` you can use caqtdm as follows:

```
export CAQTDM_DISPLAY_PATH=/work/sls/config/qt
export PATH=/usr/caqtdm/bin:$PATH

caqtdm -macro P=MTEST-HW3,M=:MOT1 /work/sls/config/qt/motor_x_all.ui
```
