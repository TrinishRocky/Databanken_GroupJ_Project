COPY Platforms FROM 'C:\postgres_import\platforms.csv' DELIMITER ',' CSV HEADER;
COPY Users FROM 'C:\postgres_import\users.csv' DELIMITER ',' CSV HEADER;
COPY BehavioralUsageMetrics FROM 'C:\postgres_import\behavioralusagemetrics.csv' DELIMITER ',' CSV HEADER;
COPY MentalHealthMetrics FROM 'C:\postgres_import\mentalhealthmetrics.csv' DELIMITER ',' CSV HEADER;
