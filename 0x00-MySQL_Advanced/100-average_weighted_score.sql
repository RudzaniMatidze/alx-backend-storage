-- Script that creates a stored procedure ComputeAverageWeightedScoreForUser
-- that computes and store the average weighted score for a student.
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN in_user_id INT)
BEGIN
    DECLARE total_weighted_score DECIMAL(10, 2) DEFAULT 0.0;
    DECLARE total_weight DECIMAL(10, 2) DEFAULT 0.0;

    -- Calculate the total weighted score for the user
    SELECT IFNULL(SUM(corrections.score * projects.weight), 0)
    INTO total_weighted_score
    FROM corrections
        INNER JOIN projects
            ON corrections.project_id = projects.id
    WHERE corrections.user_id = in_user_id;

    -- Calculate the total weight for the user
    SELECT IFNULL(SUM(projects.weight), 0)
    INTO total_weight
    FROM corrections
        INNER JOIN projects
            ON corrections.project_id = projects.id
    WHERE corrections.user_id = in_user_id;

    -- Update the user's average weighted score
    IF total_weight = 0 THEN
        UPDATE users
            SET users.average_score = 0
            WHERE users.id = in_user_id;
    ELSE
        UPDATE users
            SET users.average_score = total_weighted_score / total_weight
            WHERE users.id = in_user_id;
    END IF;
END $$
DELIMITER ;
