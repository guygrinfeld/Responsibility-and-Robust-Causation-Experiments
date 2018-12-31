* Encoding: UTF-8.
DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(responsibility=1).
VARIABLE LABELS filter_$ 'responsibility=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM S_R_3 S_R_5 S_UR_3 S_UR_5
  /WSFACTOR=robustness 2 Polynomial days 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=robustness days robustness*days.

GLM F_R_3 F_R_5 F_UR_3 F_UR_5
  /WSFACTOR=robustness 2 Polynomial days 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=robustness days robustness*days.

USE ALL.
COMPUTE filter_$=(responsibility=0).
VARIABLE LABELS filter_$ 'responsibility=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM S_R_3 S_R_5 S_UR_3 S_UR_5
  /WSFACTOR=robustness 2 Polynomial days 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=robustness days robustness*days.

GLM F_R_3 F_R_5 F_UR_3 F_UR_5
  /WSFACTOR=robustness 2 Polynomial days 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=robustness days robustness*days.
