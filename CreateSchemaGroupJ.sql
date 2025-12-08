-- Drop tables if they already exist
DROP TABLE IF EXISTS BehavioralUsageMetrics, MentalHealthMetrics, Users, Platforms CASCADE;


-- Table: Platforms
CREATE TABLE Platforms (
    platform_id SERIAL PRIMARY KEY,
    social_media_platform VARCHAR(64) NOT NULL
);

-- Table: Users
-- Relationship: User – uses – Platform (1 : MC)
CREATE TABLE Users (
    user_id VARCHAR(32) PRIMARY KEY,                    
    age INT NOT NULL,
    gender VARCHAR(32) NOT NULL,
    platform_id INT NOT NULL REFERENCES Platforms(platform_id)
);

-- Table: BehavioralUsageMetrics
-- Relationship: User – has – BehavioralMetrics (1 : 1)
-- PK = FK(User_ID)
CREATE TABLE BehavioralUsageMetrics (
    user_id VARCHAR(32) PRIMARY KEY REFERENCES Users(user_id),
    daily_screen_time NUMERIC(4,2) NOT NULL,
    days_without_social_media INT NOT NULL,
    exercise_frequency INT NOT NULL
);

-- Table: MentalHealthMetrics
-- Relationship: User – has – MentalHealth (1 : 1)
-- PK = FK(User_ID)
CREATE TABLE MentalHealthMetrics (
    user_id VARCHAR(32) PRIMARY KEY REFERENCES Users(user_id),
    sleep_quality INT NOT NULL,   -- 1–10
    stress_level INT NOT NULL,   -- 1–10
    happiness_index INT NOT NULL    -- 1–10
);