# Data Wrangling over Excel test Reports

Chemical biomarkers measurements over Ecuadorian Conocoto pacients have been taken since 2018 in a set of Excel files including:
 - Glucose [mg/dL]
 - Sodium 
 - Potassium
 - Triglycerides [mg/dL]
 - Cholesterol [mg/dL]
 - Urea [mg/dL]
 - Uric Acid [mg/dL]
 - Transaminases [U/L]
 - Amylases [U/L]
 - Lypases [U/L]
 - Hormones (PSA, \beta HCG, Troponines, D-Dimer, T3, T4, TSH, etc) and more.
 - Toxicological tests [Yes / No]
 - Gasometries
Biological measurements also includes:
- Haematological biometries
- Elemental and microscopic examination of urine
- Coproparasitarium

Here, there is a set of scripts for extraction of this valuable information and its conversion from a print-ready state in Excel Spreadsheets to a fully-relational format.
# Explanation
These scripts converts a set of excel tables from this:
|                        |                |           |        |                                       |                      |       |
|------------------------|----------------|-----------|--------|---------------------------------------|----------------------|-------|
|                        |                |           |        |                                       |                      |       |
|                        |                |           |        |                                       |                      |       |
|                        |                |           |        |                                       |                      |       |
| NOMBRE:                | RUMI ÑAHUI     |           | FECHA  |               14/04/2024              |                      |       |
| Muestra:               |                | SANGRE    |        | HOSPITALIZACION                       |                      |       |
| QUIMICA SANGUINEA      |                | RESULTADO |        |           VALORES DE REFERENCIA       |                      |       |
| GLUCOSA   BASAL        |                |           | mg/dL  |                                       |       74 - 115       | mg/dL |
| UREA                   |                |           | mg/dL  |                                       |        15 - 45       | mg/dL |
| CREATININA             |                |      0.74 | mg/dL  |               H 0,6-1,1    M 0,5-0,9  |                      | mg/dL |
| ACIDO   URICO          |                |           | mg/dL  |                                       |      2,5  -  7       | mg/dL |
| COLESTEROL             |                |           | mg/dL  |                                       |      HASTA  220      | mg/dL |
| TRIGLICERIDOS          |                |           | mg/dL  |                                       |       HASTA 140      | mg/dL |
| HDL   COLESTEROL       |                |           | mg/dL  |                     H35-55  M45-65    |                      | mg/dL |
| LDL   COLESTEROL       |                |           | mg/dL  |                                       |       HASTA 170      | mg/dL |
| TGO                    |                |           | U/L    |                                       |       HASTA  38      | U/L   |
| TGP                    |                |      24.7 | U/L    |                                       |       HASTA  40      | U/L   |
| FOSFATASA   ALCALINA   |                |           | U/L    |                  H 53-128  M 42-141   |                      | U/L   |
| BILIRUBINA   TOTAL     |                |           | mg/dL  |                                       |      HASTA 1.00      | mg/dL |
| BILIRUBINA  DIRECTA    |                |           | mg/dL  |                                       |      HASTA 0.25      | mg/dL |
| BILIRUBINA   INDIRECTA |                |           | mg/dL  |                                       |      HASTA 0.75      | mg/dL |
| AMILASA                |                |           | U/L    |                                       |        28-100        | U/L   |
| LIPASA                 |                |           | U/L    |                                       |          60          | U/L   |
| GLUCOSA   POSPRANDIAL  |                |           | mg/dL  |                                       |       55 - 115       | mg/dL |
|                        |                |           |        | VALIDADO                              | PHD. GUIVER MAC      |       |

Onto this:

| Nombre     | Fecha      | Tipo            | Prueba     | Medicion |
|------------|------------|-----------------|------------|----------|
| RUMI ÑAHUI | 14/04/2024 | HOSPITALIZACION | CREATININA | 0.74     |
| RUMI ÑAHUI | 14/04/2024 | HOSPITALIZACION | TGP        | 24.7     |
