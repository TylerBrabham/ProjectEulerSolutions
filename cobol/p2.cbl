IDENTIFICATION DIVISION.
PROGRAM-ID. P2.
AUTHOR. Tyler Brabham.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 A PIC 9(7) VALUE ZEROS.
01 B PIC 9(7) VALUE ZEROS.
01 Temp PIC 9(7) VALUE ZEROS.
01 Result PIC 9(8) VALUE ZEROS.
01 LeftOver2 PIC 9 VALUE ZEROS.
01 Unused PIC 9 VALUE ZEROS.
01 EndOfLoop PIC 9.
    88 Nosir VALUE 0.
    88 Yesir VALUE 1.
    
PROCEDURE DIVISION.
CalculateP2.
    SET Nosir TO TRUE
    SET B TO 1
    SET A TO 0
    PERFORM WITH TEST BEFORE UNTIL Yesir
        DIVIDE B BY 2 GIVING Unused REMAINDER LeftOver2
        IF LeftOver2 IS EQUAL TO 0 THEN
            ADD B TO Result GIVING Result
        END-IF

        SET Temp TO B
        ADD B TO A GIVING B
        SET A TO Temp
        
        IF B > 4000000 THEN
            SET Yesir TO TRUE
        END-IF
    END-PERFORM
    DISPLAY Result.
    STOP RUN.