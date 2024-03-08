*** Settings ***
Documentation  Example de prise de mesure et d'alerte sur depassement d'un temps de test 
...  construction d'un cas de test de perf unitaire dynamique

Library      ../lib/q1_perf_listener.py


*** Test Cases ***
Cas de test avec monitoring du temps d'execution unitaire
  [Documentation]  Cas de test  d'attente pour simuler un comportement
  [Tags]  TNR

  S'authentifier


*** Keywords ***
Logon
  [Documentation]  Keyword dont il faut alerter sur le temps d'exécution
  [Timeout]  ${Q1_PERF_TIMEOUT}
  [Tags]  Q1_PERF

  sleep  6s

S'authentifier
  [Documentation]  Keyword dont il faut alerter sur le temps d'exécution

  Logon
