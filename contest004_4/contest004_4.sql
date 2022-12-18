WITH DATE_TBL AS (
    SELECT
        '2022-08-01' AS CLDATE,
        STRFTIME('%w', '2022-08-01') AS WKNO,
        SUBSTR('日月火水木金土', STRFTIME('%w', '2022-08-01') + 1, 1) AS WEEK
    UNION ALL
    SELECT
        DATE(CLDATE, '+1 days'),
        STRFTIME('%w', DATE(CLDATE, '+1 days')),
        SUBSTR('日月火水木金土', STRFTIME('%w', DATE(CLDATE, '+1 days')) + 1, 1)
    FROM
        DATE_TBL
    WHERE
        CLDATE < '2022-08-31'
)
SELECT
    CLDATE AS REGIST_DATE,
    WEEK AS WK,
    COUNT(USER_CODE) AS TOTAL
FROM
    DATE_TBL
-- DATE_TBLの全レコードとマッチするUSERSのレコードを取得
LEFT OUTER JOIN
    USERS
    ON
        DATE(USERS.CONFIRMED_AT) = DATE_TBL.cldate
    AND
        USERS.VALID_FLG = '1'
GROUP BY
    CLDATE
ORDER BY
    REGIST_DATE;
