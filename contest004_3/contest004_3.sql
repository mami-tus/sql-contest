SELECT
    ROUND(AVG(TOTAL_VALUE)) AS SA_MEDIAN
FROM
    (
        SELECT
            TOTAL_VALUE
        FROM
            CONVENIENCE
        WHERE
            SURVEY_YEAR = 2019
            AND KIND_CODE = '100'
        ORDER BY
            TOTAL_VALUE
        LIMIT
            2 - (
                SELECT
                    COUNT(*) % 2
                FROM
                    CONVENIENCE
                WHERE
                    SURVEY_YEAR = 2019
                    AND KIND_CODE = '100'
            )
        OFFSET (
            SELECT
                (COUNT(*) - 1) / 2
            FROM
                CONVENIENCE
            WHERE
                SURVEY_YEAR = 2019
                AND KIND_CODE = '100'
            )
    );
