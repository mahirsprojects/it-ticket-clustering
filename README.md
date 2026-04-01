# IT Support Ticket Clustering

## The Business Question

IT support teams handle hundreds of tickets a week across different departments, 
categories, and priority levels. Some tickets get resolved in hours. Others sit 
open for days and consume disproportionate effort from senior staff.

The question this project tries to answer: which ticket channels actually consume 
the most operational effort, and where would an automated triage system reduce 
the load on human routing?

The honest answer to that question requires pattern discovery across a large 
volume of tickets without assuming in advance what the patterns are. That is 
why clustering is the right tool here. There are no labelled outcomes to predict. 
The goal is to let the data surface natural groupings and then interpret what 
those groups mean for how a support team operates.

---

## What This Project Does

1. Queries the raw dataset using SQL to filter, aggregate by department and 
ticket type, and calculate average resolution times before any modelling begins
2. Uses the elbow method to justify the number of clusters chosen, because 
clustering has no ground truth and that choice requires human judgement
3. Interprets each cluster in plain English and maps the findings back to a 
concrete operational recommendation
4. Uses ChatGPT to prepare a detailed report with reccomendations based on insights from clustering.

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

## Tech Stack

- Python (pandas, scikit-learn, matplotlib, seaborn)
- SQLite (via sqlite3 in notebook)
- KMeans clustering with elbow method and silhouette scoring
- ChatGPT for reporting
- Dataset: Customer Support Ticket Dataset via Kaggle

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


