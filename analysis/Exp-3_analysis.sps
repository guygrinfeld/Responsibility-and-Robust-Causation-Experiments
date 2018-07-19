* Encoding: UTF-8.

DATASET ACTIVATE DataSet2.

GLM Ra_Ru_3 Ra_Ru_5 Ra_URu_3 Ra_URu_5 Sw_Ru_3 Sw_Ru_5 Sw_URu_3 Sw_URu_5
  /WSFACTOR=assigned 2 Simple robust 2 Simple days 2 Simple 
  /METHOD=SSTYPE(3)
  /PRINT=DESCRIPTIVE ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=assigned robust days assigned*robust assigned*days robust*days assigned*robust*days.
