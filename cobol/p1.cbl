IDENTIFICATION DIVISION.
PROGRAM-ID. P1.
AUTHOR. Tyler Brabham.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Num PIC 999 VALUE ZEROS.
01 Result PIC 9(6) VALUE ZEROS.
01 LeftOver3 PIC 999 VALUE ZEROS.
01 LeftOver5 PIC 999 VALUE ZEROS.
01 Unused PIC 999 VALUE ZEROS.

PROCEDURE DIVISION.
CalculateP1.
    PERFORM 999 TIMES
        ADD 1 TO Num GIVING Num
        DIVIDE Num BY 3 GIVING Unused REMAINDER LeftOver3
        DIVIDE Num BY 5 GIVING Unused REMAINDER LeftOver5
        IF LeftOver3 IS EQUAL TO 0 OR LeftOver5 IS EQUAL TO 0 THEN
            ADD Num TO Result GIVING Result
    END-PERFORM
    DISPLAY Result.
    STOP RUN.