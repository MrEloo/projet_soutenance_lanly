<?php


class ExerciceManager extends AbstractManager
{
    public function getAllExercicesByCat($global_category_id, int $language_id): array
    {
        $selectAllExByCatQuery = $this->db->prepare('SELECT * FROM exercices WHERE exercices.global_category_id = :global_category_id AND language_id = :language_id');
        $parameters = ['global_category_id' => $global_category_id, 'language_id' => $language_id];
        $selectAllExByCatQuery->execute($parameters);
        $exercices_data = $selectAllExByCatQuery->fetchAll(PDO::FETCH_ASSOC);

        $exercices_array = [];


        $gcm = new GlobalCategoryManager();


        foreach ($exercices_data as $exercice_data) {
            $global_category = $gcm->getOneCatById($exercice_data['global_category_id']);
            $exercice = new Exercice($exercice_data['title'], $exercice_data['difficulty'], $exercice_data['question'], $exercice_data['correction_text'], $exercice_data['correction'], $global_category, $exercice_data['course_id']);
            $exercice->setId($exercice_data['id']);
            $exercices_array[] = $exercice;
        }

        return $exercices_array;
    }

    public function getAllExercicesByCourse(int $course_id, int $language_id): array
    {
        $selectAllExByCourseQuery = $this->db->prepare('SELECT * FROM exercices WHERE exercices.course_id = :course_id  AND language_id = :language_id');
        $parameters = ['course_id' => $course_id, 'language_id' => $language_id];
        $selectAllExByCourseQuery->execute($parameters);
        $exercices_data = $selectAllExByCourseQuery->fetchAll(PDO::FETCH_ASSOC);

        $exercices_array = [];
        $gcm = new GlobalCategoryManager();


        foreach ($exercices_data as $exercice_data) {
            $global_category = $gcm->getOneCatById($exercice_data['global_category_id']);
            $exercice = new Exercice($exercice_data['title'], $exercice_data['difficulty'], $exercice_data['question'], $exercice_data['correction_text'], $exercice_data['correction'], $global_category, $exercice_data['course_id']);
            $exercice->setId($exercice_data['id']);
            $exercices_array[] = $exercice;
        }

        return $exercices_array;
    }

    public function getAllExercices(): array
    {
        $selectAllExByCourseQuery = $this->db->prepare('SELECT * FROM exercices');
        $selectAllExByCourseQuery->execute();
        $exercices_data = $selectAllExByCourseQuery->fetchAll(PDO::FETCH_ASSOC);

        $exercices_array = [];
        $gcm = new GlobalCategoryManager();



        foreach ($exercices_data as $exercice_data) {
            $global_category = $gcm->getOneCatById($exercice_data['global_category_id']);
            $exercice = new Exercice($exercice_data['title'], $exercice_data['difficulty'], $exercice_data['question'], $exercice_data['correction_text'], $exercice_data['correction'], $global_category, $exercice_data['course_id']);
            $exercice->setId($exercice_data['id']);
            $exercices_array[] = $exercice;
        }
        return $exercices_array;
    }

    public function deleteExercice(int $id): void
    {
        $deleteCourseQuery = $this->db->prepare('DELETE FROM exercices WHERE id = :id ');
        $parameters = ['id' => $id];
        $deleteCourseQuery->execute($parameters);
    }

    public function updateExercice(int $id, string $title, string $difficulty, string $question, string $correction_text, string $correction, int $global_category_id, int $course_id): void
    {
        $updateExerciceQuery = $this->db->prepare('UPDATE exercices SET title = :title, difficulty = :difficulty, question = :question, correction_text = :correction_text, correction = :correction, global_category_id = :global_category_id, course_id = :course_id WHERE id = :id');

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

        $updateExerciceQuery->execute($parameters);
    }

    public function addExercice(string $title, string $difficulty, string $question, string $correction_text, string $correction, int $global_category_id, int $course_id, int $language_id): void
    {
        $insertExerciceQuery = $this->db->prepare('INSERT INTO exercices (title, difficulty, question, correction_text, correction, global_category_id, course_id, language_id) VALUES (:title, :difficulty, :question, :correction_text, :correction, :global_category_id, :course_id, :language_id)');

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

        $insertExerciceQuery->execute($parameters);
    }
}
