SELECT
    AGE_GRP.AGE_NAME AS 年齢階層,
    SUM(
        CASE
            WHEN TIME_CODE = 120 THEN TARGET_POP
            ELSE 0
        END
    ) AS "5時間未満",
    SUM(
        CASE
            WHEN TIME_CODE = 130 THEN TARGET_POP
            ELSE 0
        END
    ) AS "5時間以上6時間未満",
    SUM(
        CASE
            WHEN TIME_CODE = 140 THEN TARGET_POP
            ELSE 0
        END
    ) AS "6時間以上7時間未満",
    SUM(
        CASE
            WHEN TIME_CODE = 150 THEN TARGET_POP
            ELSE 0
        END
    ) AS "7時間以上8時間未満",
    SUM(
        CASE
            WHEN TIME_CODE = 160 THEN TARGET_POP
            ELSE 0
        END
    ) AS "8時間以上9時間未満",
    SUM(
        CASE
            WHEN TIME_CODE = 170 THEN TARGET_POP
            ELSE 0
        END
    ) AS "9時間以上",
    SUM(
        CASE
            WHEN TIME_CODE = 180 THEN TARGET_POP
            ELSE 0
        END
    ) AS 不詳
FROM
    SLEEP_TIME_DTL
    INNER JOIN AGE_GRP ON AGE_GRP.AGE_CODE = SLEEP_TIME_DTL.AGE_CODE
GROUP BY
    AGE_GRP.AGE_CODE
ORDER BY
    AGE_GRP.AGE_CODE;
