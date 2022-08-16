drugConceptsPath <- "~/chandryou/PredDrugInducedKidneyInjury/inst/settings/DrugConceptsToCreate.csv"
drugConcepts <- read.csv(drugConceptsPath)

#SQL

S <- SqlRender::readSql("~/chandryou/PredDrugInducedKidneyInjury/inst/sql/sql_server/MOAnormal_Kidney_acetaminophen.sql")

for(i in seq(nrow(drugConcepts))){
  drugConceptId <- drugConcepts$concept_id[i]
  drugConceptName <- drugConcepts$concept_name[i]

  SS <- gsub(1125315, drugConceptId, S)
  filename <- paste0("~/chandryou/PredDrugInducedKidneyInjury/inst/sql/sql_server/MOAnormal_Kidney_", drugConceptName, ".sql")
  writeLines(SS, filename)
}

#Json

J <- readLines("C:/Users/whyj1/Documents/chandryou/PredDrugInducedKidneyInjury/inst/cohorts/MOAnormal_Kidney_acetaminophen.json")

for(i in seq(nrow(drugConcepts))){
  drugConceptId <- drugConcepts$concept_id[i]
  drugConceptName <- drugConcepts$concept_name[i]
  
  JJ <- gsub(1125315, drugConceptId, J)
  JJ <- gsub("acetaminophen", drugConceptName, JJ)
  filename <- paste0("~/chandryou/PredDrugInducedKidneyInjury/inst/cohorts/MOAnormal_Kidney_", drugConceptName, ".json")
  writeLines(JJ, filename)
}

