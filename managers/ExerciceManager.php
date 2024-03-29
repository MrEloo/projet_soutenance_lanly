<?php


class ExerciceManager extends AbstractManager
{
    public function getAllExercicesByCat($global_category_id, int $language_id): ?array
    {
        $selectAllExByCatQuery = $this->db->prepare("SELECT * FROM exercices_{$_SESSION['user_lang']} WHERE exercices_{$_SESSION['user_lang']}.global_category_id = :global_category_id AND language_id = :language_id");
        $parameters = ['global_category_id' => $global_category_id, 'language_id' => $language_id];
        $selectAllExByCatQuery->execute($parameters);
        $exercices_data = $selectAllExByCatQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($exercices_data) {
            $exercices_array = [];


            $gcm = new GlobalCategoryManager();


            foreach ($exercices_data as $exercice_data) {
                $global_category = $gcm->getOneCatById($exercice_data['global_category_id']);
                $exercice = new Exercice($exercice_data['title'], $exercice_data['difficulty'], $exercice_data['question'], $exercice_data['correction_text'], $exercice_data['correction'], $global_category, $exercice_data['course_id']);
                $exercice->setId($exercice_data['id']);
                $exercices_array[] = $exercice;
            }

            return $exercices_array;
        } else {
            return null;
        }
    }

    public function getAllExercicesByCourse(int $course_id, int $language_id): ?array
    {
        $selectAllExByCourseQuery = $this->db->prepare("SELECT * FROM exercices_{$_SESSION['user_lang']} WHERE exercices_{$_SESSION['user_lang']}.course_id = :course_id  AND language_id = :language_id");
        $parameters = ['course_id' => $course_id, 'language_id' => $language_id];
        $selectAllExByCourseQuery->execute($parameters);
        $exercices_data = $selectAllExByCourseQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($exercices_data) {
            $exercices_array = [];
            $gcm = new GlobalCategoryManager();


            foreach ($exercices_data as $exercice_data) {
                $global_category = $gcm->getOneCatById($exercice_data['global_category_id']);
                $exercice = new Exercice($exercice_data['title'], $exercice_data['difficulty'], $exercice_data['question'], $exercice_data['correction_text'], $exercice_data['correction'], $global_category, $exercice_data['course_id']);
                $exercice->setId($exercice_data['id']);
                $exercices_array[] = $exercice;
            }

            return $exercices_array;
        } else {
            return null;
        }
    }

    public function getAllExercices(): ?array
    {
        $selectAllExByCourseQuery = $this->db->prepare("SELECT * FROM exercices_{$_SESSION['user_lang']}");
        $selectAllExByCourseQuery->execute();
        $exercices_data = $selectAllExByCourseQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($exercices_data) {
            $exercices_array = [];
            $gcm = new GlobalCategoryManager();



            foreach ($exercices_data as $exercice_data) {
                $global_category = $gcm->getOneCatById($exercice_data['global_category_id']);
                $exercice = new Exercice($exercice_data['title'], $exercice_data['difficulty'], $exercice_data['question'], $exercice_data['correction_text'], $exercice_data['correction'], $global_category, $exercice_data['course_id']);
                $exercice->setId($exercice_data['id']);
                $exercices_array[] = $exercice;
            }
            return $exercices_array;
        } else {
            return null;
        }
    }

    public function deleteExercice(int $id): void
    {
        $deleteCourse_deQuery = $this->db->prepare("DELETE FROM exercices_de WHERE id = :id ");
        $deleteCourse_enQuery = $this->db->prepare("DELETE FROM exercices_en WHERE id = :id ");
        $deleteCourse_esQuery = $this->db->prepare("DELETE FROM exercices_es WHERE id = :id ");
        $deleteCourse_frQuery = $this->db->prepare("DELETE FROM exercices_fr WHERE id = :id ");
        $deleteCourse_itQuery = $this->db->prepare("DELETE FROM exercices_it WHERE id = :id ");
        $deleteCourse_ruQuery = $this->db->prepare("DELETE FROM exercices_ru WHERE id = :id ");

        $parameters = ['id' => $id];

        $deleteCourse_deQuery->execute($parameters);
        $deleteCourse_enQuery->execute($parameters);
        $deleteCourse_esQuery->execute($parameters);
        $deleteCourse_frQuery->execute($parameters);
        $deleteCourse_itQuery->execute($parameters);
        $deleteCourse_ruQuery->execute($parameters);
    }

    public function updateExercice(int $id, string $title, string $difficulty, string $question, string $correction_text, string $correction, int $global_category_id, int $course_id): void
    {
        $updateExercicQuery = $this->db->prepare("UPDATE exercices_{$_SESSION['user_lang']} SET title = :title, difficulty = :difficulty, question = :question, correction_text = :correction_text, correction = :correction, global_category_id = :global_category_id, course_id = :course_id WHERE id = :id");

        $parameters = [
            'id' => $id,
            'title' => $title,
            'difficulty' => $difficulty,
            'question' => $question,
            'correction_text' => $correction_text,
            'correction' => $correction,
            'global_category_id' => $global_category_id,
            'course_id' => $course_id
        ];

        $updateExercicQuery->execute($parameters);
    }

    public function addExercice(string $title, string $difficulty, string $question, string $correction_text, string $correction, int $global_category_id, int $course_id, int $language_id): void
    {
        $insertExercice_deQuery = $this->db->prepare('INSERT INTO exercices_de (title, difficulty, question, correction_text, correction, global_category_id, course_id, language_id) VALUES (:title, :difficulty, :question, :correction_text, :correction, :global_category_id, :course_id, :language_id)');
        $insertExercice_enQuery = $this->db->prepare('INSERT INTO exercices_en (title, difficulty, question, correction_text, correction, global_category_id, course_id, language_id) VALUES (:title, :difficulty, :question, :correction_text, :correction, :global_category_id, :course_id, :language_id)');
        $insertExercice_esQuery = $this->db->prepare('INSERT INTO exercices_es (title, difficulty, question, correction_text, correction, global_category_id, course_id, language_id) VALUES (:title, :difficulty, :question, :correction_text, :correction, :global_category_id, :course_id, :language_id)');
        $insertExercice_frQuery = $this->db->prepare('INSERT INTO exercices_fr (title, difficulty, question, correction_text, correction, global_category_id, course_id, language_id) VALUES (:title, :difficulty, :question, :correction_text, :correction, :global_category_id, :course_id, :language_id)');
        $insertExercice_itQuery = $this->db->prepare('INSERT INTO exercices_it (title, difficulty, question, correction_text, correction, global_category_id, course_id, language_id) VALUES (:title, :difficulty, :question, :correction_text, :correction, :global_category_id, :course_id, :language_id)');
        $insertExercice_ruQuery = $this->db->prepare('INSERT INTO exercices_ru (title, difficulty, question, correction_text, correction, global_category_id, course_id, language_id) VALUES (:title, :difficulty, :question, :correction_text, :correction, :global_category_id, :course_id, :language_id)');

        $parameters = [
            'title' => $title,
            'difficulty' => $difficulty,
            'question' => $question,
            'correction_text' => $correction_text,
            'correction' => $correction,
            'global_category_id' => $global_category_id,
            'course_id' => $course_id,
            'language_id' => $language_id
        ];

        $insertExercice_deQuery->execute($parameters);
        $insertExercice_enQuery->execute($parameters);
        $insertExercice_esQuery->execute($parameters);
        $insertExercice_frQuery->execute($parameters);
        $insertExercice_itQuery->execute($parameters);
        $insertExercice_ruQuery->execute($parameters);
    }
}
