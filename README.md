# IT Support Ticket Clustering

## The Business Question

IT support teams handle hundreds of tickets a week across different departments, 
categories, and priority levels. Some tickets get resolved in hours. Others sit 
open for days and consume disproportionate effort from senior staff.

The question this project tries to answer: which ticket types actually consume 
the most operational effort, and where would an automated triage system reduce 
the load on human routing?

The honest answer to that question requires pattern discovery across a large 
volume of tickets without assuming in advance what the patterns are. That is 
why clustering is the right tool here. There are no labelled outcomes to predict. 
The goal is to let the data surface natural groupings and then interpret what 
those groups mean for how a support team operates.

---

## What This Project Does

1. Queries the raw ITSM dataset using SQL to filter, aggregate by department and 
ticket type, and calculate average resolution times before any modelling begins
2. Uses ChatGPT to enrich 50 unlabelled ticket descriptions with AI generated 
category labels, urgency scores, and root cause summaries, then merges those 
back into the dataset as new features
3. Runs KMeans clustering twice: once on the original features alone, and once 
on the original features plus the AI generated ones, to measure whether AI 
enrichment produces better defined clusters
4. Uses the elbow method to justify the number of clusters chosen, because 
clustering has no ground truth and that choice requires human judgement
5. Interprets each cluster in plain English and maps the findings back to a 
concrete operational recommendation

---

## Why Unsupervised Learning

Most ML projects on resumes use supervised learning because there is a clear 
target variable to predict. This project uses clustering deliberately because 
the business problem does not come with labelled outcomes.

Nobody has tagged each ticket as "high effort" or "automation candidate" in 
advance. The model has to discover that structure on its own. That is the actual 
shape of a lot of real operational data, and knowing when to reach for 
unsupervised methods over supervised ones is a meaningful distinction.

---

## The AI Integration

Before any ML code runs, ChatGPT processes 50 raw ticket descriptions and 
returns structured labels: a category, an urgency level, and a likely root cause 
per ticket. Those outputs are saved as a CSV in `ai_inputs/` alongside the exact 
prompt used to generate them.

Those AI generated columns then feed directly into the clustering model as 
features. The notebook runs KMeans with and without them and compares the 
silhouette scores of both runs. Where the AI enriched version produces tighter, 
more interpretable clusters, that gap is the evidence that AI was doing real 
analytical work in the pipeline, not sitting decoratively at the end of it.

---

## Tech Stack

- Python (pandas, scikit-learn, matplotlib, seaborn)
- SQLite (via sqlite3 in notebook)
- KMeans clustering with elbow method and silhouette scoring
- ChatGPT for pre-model data enrichment
- Dataset: IT Service Management (ITSM) Ticket Dataset via Kaggle

---

## Repo Structure
```
├── README.md
├── data/
│   ├── raw/                  # original Kaggle dataset
│   └── processed/            # cleaned, feature-engineered version
├── sql/
│   └── aggregations.sql      # resolution time queries by dept and category
├── notebooks/
│   └── clustering_analysis.ipynb
├── ai_inputs/
│   ├── prompt_used.txt       # exact ChatGPT prompt
│   └── chatgpt_labels.csv    # AI generated labels per ticket
└── outputs/
    ├── elbow_curve.png
    ├── cluster_profiles.csv
    └── feature_importance_comparison.png
```

---

## Cluster Interpretations

*[outcomes]*

---

## Business Recommendation

*[outcomes]*

---

## What I Learned

Clustering forces a different kind of thinking than supervised learning. There 
is no accuracy metric to optimize toward. The elbow method gives you a 
reasonable starting point for choosing K, but the final call on whether four 
clusters make more operational sense than five comes down to whether a 
support manager would actually find those groupings useful.

The AI enrichment step made that judgement easier. Having urgency and root cause 
labels as features gave the clusters more semantic texture than resolution time 
and priority alone. Whether that holds up numerically is in the results above.
