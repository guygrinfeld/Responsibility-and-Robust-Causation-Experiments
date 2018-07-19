* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
USE ALL.
FILTER BY filter_$.
EXECUTE.


GLM Robust_4 Robust_2 Non_robust_4 Non_robust_2 BY experiement
  /WSFACTOR=Robust 2 Polynomial Goals 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ HOMOGENEITY 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Robust Goals Robust*Goals
  /DESIGN=experiement.
