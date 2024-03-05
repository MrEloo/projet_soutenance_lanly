<?php


class ExerciceManager extends AbstractManager
{
    public function getAllExercicesByCat($global_category_id): array
    {
        $selectAllExByCatQuery = $this->db->prepare('SELECT * FROM exercices WHERE exercices.global_category_id = :global_category_id;');
        $parameters = ['global_category_id' => $global_category_id];
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

    public function getAllExercicesByCourse(int $course_id): array
    {
        $selectAllExByCourseQuery = $this->db->prepare('SELECT * FROM exercices WHERE exercices.course_id = :course_id;');
        $parameters = ['course_id' => $course_id];
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
}
