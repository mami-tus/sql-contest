DELETE FROM EMP
WHERE
    EMP.VALID_FLG = '0'
    AND EMP.EMP_CODE IN (
        SELECT
            EMP_INVALID.EMP_CODE
        FROM
            EMP_INVALID
    );
