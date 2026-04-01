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

The clustering analysis reveals three distinct operational patterns driven primarily by support channels rather than ticket type or priority. Cluster 1, dominated by chat and social media, represents a high volume workload that contributes the majority of total operational effort, indicating a scale driven burden with strong potential for automation. Cluster 2, centered around email, shows the highest resolution time per ticket, highlighting inefficiencies in handling, likely due to unstructured input and slower workflows. Cluster 0, associated with phone support, reflects a stable and moderate workload with balanced characteristics, suggesting consistent but less scalable operations. Together, these clusters indicate that workload is shaped by how requests enter the system, with volume driving effort in digital channels and process inefficiencies driving time in email based support.

---

## Business Recommendation

For high volume chat and social media channels, the priority is reducing incoming ticket volume through automation, including AI chatbots, self service flows, and automatic classification to handle repetitive queries at scale. For email based support, efforts should target efficiency improvements by introducing structured intake forms, AI powered summarization, and intelligent routing to reduce resolution time and minimize back and forth communication. Phone support, being stable and less scalable for automation, should be optimized through better routing and agent assist tools rather than heavy automation. Overall, the strategy should combine volume reduction in high traffic channels with workflow optimization in high effort channels to achieve meaningful operational efficiency gains.

---

## What I Learned

Clustering forces a different kind of thinking than supervised learning. There 
is no accuracy metric to optimize toward. The elbow method gives you a 
reasonable starting point for choosing K, but the final call on whether four 
clusters make more operational sense than five comes down to whether a 
support manager would actually find those groupings useful.


