-- 1 Base de dados e criação de tabela

CREATE TABLE student_prediction(
    cod_student SERIAL PRIMARY KEY,
    studentid VARCHAR(20),
    age INT,
    gender INT,
    hs_type INT,
    scholarship INT,
    work INT,
    activity INT,
    partner INT,
    salary INT,
    transport INT,
    living INT,
    mother_edu INT,
    father_edu INT,
    siblings INT,
    kids INT,
    mother_job INT,
    father_job INT,
    study_hrs INT,
    read_freq INT,
    read_freq_sci INT,
    attend_dept INT,
    impact INT,
    attend INT,
    prep_study INT,
    prep_exam INT,
    notes INT,
    listens INT,
    likes_discuss INT,
    classroom INT,
    cuml_gpa INT,
    exp_gpa INT,
    course_id INT,
    grade INT
);


-- 2 Resultado em função da formação dos pais


CREATE OR REPLACE PROCEDURE sp_aprovados_pais_phd()
LANGUAGE plpgsql
AS $$
DECLARE
    v_total INT;
BEGIN

    SELECT COUNT(*)
    INTO v_total
    FROM student_prediction
    WHERE mother_edu = 6
      AND father_edu = 6
      AND grade >= 4;

    RAISE NOTICE 'Total de aprovados com pais PhD: %', v_total;

END;
$$;

CALL sp_aprovados_pais_phd();


--3 Resultado em função dos estudos

CREATE OR REPLACE PROCEDURE sp_aprovados_estudam_sozinho
(OUT total_aprovados INT)
LANGUAGE plpgsql
AS $$
BEGIN

    SELECT COUNT(*)
    INTO total_aprovados
    FROM student_prediction
    WHERE prep_study = 1
      AND grade >= 1;

END;
$$;vado

CALL sp_aprovados_estudam_sozinho();