-- Objective 3: Final Analytical Queries

USE GroupJ;

-- =======================================================
-- Query 1: Impact of "Social Media Detox" on Sleep Quality
-- Purpose: To check if taking break days improves sleep.

SELECT 
    b.days_without_social_media AS Detox_Days,
    ROUND(AVG(m.sleep_quality), 2) AS Avg_Sleep_Score
FROM BehavioralUsageMetrics b
JOIN MentalHealthMetrics m ON b.user_id = m.user_id
GROUP BY b.days_without_social_media
ORDER BY b.days_without_social_media ASC;

-- =======================================================
-- Query 2: Screen Time vs. Stress Level Correlation
-- Purpose: To see if high daily usage correlates with higher stress.

SELECT 
    CASE 
        WHEN b.daily_screen_time < 2 THEN 'Low (<2h)'
        WHEN b.daily_screen_time BETWEEN 2 AND 5 THEN 'Moderate (2-5h)'
        ELSE 'High (>5h)'
    END AS Usage_Category,
    ROUND(AVG(m.stress_level), 2) AS Avg_Stress_Level,
    ROUND(AVG(m.happiness_index), 2) AS Avg_Happiness
FROM BehavioralUsageMetrics b
JOIN MentalHealthMetrics m ON b.user_id = m.user_id
GROUP BY Usage_Category
ORDER BY Avg_Stress_Level DESC;

-- =======================================================
-- Query 3: Platform Impact on Stress & Happiness
-- Purpose: To identify which platform users are most stressed.

SELECT 
    p.social_media_platform, 
    ROUND(AVG(m.stress_level), 2) AS avg_stress, 
    ROUND(AVG(m.happiness_index), 2) AS avg_happiness
FROM Platforms p
JOIN Users u ON p.platform_id = u.platform_id
JOIN MentalHealthMetrics m ON u.user_id = m.user_id
GROUP BY p.social_media_platform
ORDER BY avg_stress DESC;

-- =======================================================
-- Query 4: Exercise Frequency vs. Happiness
-- Purpose: To compare exercise habits with mental well-being.

SELECT 
    b.exercise_frequency,
    ROUND(AVG(m.happiness_index), 2) AS avg_happiness,
    ROUND(AVG(m.stress_level), 2) AS avg_stress
FROM BehavioralUsageMetrics b
JOIN MentalHealthMetrics m ON b.user_id = m.user_id
GROUP BY b.exercise_frequency
ORDER BY b.exercise_frequency;