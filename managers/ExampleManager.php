<?php


class ExampleManager extends AbstractManager
{


    public function getExamplesFromCourse(int $course_id, int $language_id): ?array
    {
        if ($this->verifyLanguage('examples')) {
            $table = $this->verifyLanguage('examples');

            $selectExamplesFromCourse = $this->db->prepare("SELECT * FROM $table WHERE course_id = :course_id AND language_id = :language_id");
            $parameters = ['course_id' => $course_id, 'language_id' => $language_id];
            $selectExamplesFromCourse->execute($parameters);
            $examples_data = $selectExamplesFromCourse->fetchAll(PDO::FETCH_ASSOC);

            if ($examples_data) {
                $examples_array = [];

                foreach ($examples_data as $key => $example_data) {
                    $example = new Example($example_data['description']);
                    $example->setId($example_data['id']);
                    $examples_array[] = $example;
                }

                return $examples_array;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    public function getAllExamples(): ?array
    {

        if ($this->verifyLanguage('examples')) {
            $table = $this->verifyLanguage('examples');

            $selectExamplesFromCourse = $this->db->prepare("SELECT * FROM $table");
            $selectExamplesFromCourse->execute();
            $examples_data = $selectExamplesFromCourse->fetchAll(PDO::FETCH_ASSOC);

            $examples_array = [];

            if ($examples_data) {
                foreach ($examples_data as $key => $example_data) {
                    $example = new Example($example_data['description']);
                    $example->setCourse_id($example_data['course_id']);
                    $example->setId($example_data['id']);
                    $examples_array[] = $example;
                }

                return $examples_array;
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    public function updateExample(int $example_id, string $description, int $course_id, int $language_id): void
    {

        if ($this->verifyLanguage('examples')) {
            $table = $this->verifyLanguage('examples');

            $updateExampleQuery = $this->db->prepare("UPDATE $table SET description = :description, course_id = :course_id, language_id = :language_id WHERE id = :example_id");

            $parameters = [
                'example_id' => $example_id,
                'description' => $description,
                'course_id' => $course_id,
                'language_id' => $language_id,
            ];

            $updateExampleQuery->execute($parameters);
        } 
    }

    public function addExample(string $description, int $course_id, int $language_id): void
    {
        $insertExemple_deQuery = $this->db->prepare('INSERT INTO examples_de (description, course_id, language_id) VALUES (:description, :course_id, :language_id)');
        $insertExemple_enQuery = $this->db->prepare('INSERT INTO examples_en (description, course_id, language_id) VALUES (:description, :course_id, :language_id)');
        $insertExemple_esQuery = $this->db->prepare('INSERT INTO examples_es (description, course_id, language_id) VALUES (:description, :course_id, :language_id)');
        $insertExemple_frQuery = $this->db->prepare('INSERT INTO examples_fr (description, course_id, language_id) VALUES (:description, :course_id, :language_id)');
        $insertExemple_itQuery = $this->db->prepare('INSERT INTO examples_it (description, course_id, language_id) VALUES (:description, :course_id, :language_id)');
        $insertExemple_ruQuery = $this->db->prepare('INSERT INTO examples_ru (description, course_id, language_id) VALUES (:description, :course_id, :language_id)');

        $parameters = [
            'description' => $description,
            'course_id' => $course_id,
            'language_id' => $language_id
        ];

        $insertExemple_deQuery->execute($parameters);
        $insertExemple_enQuery->execute($parameters);
        $insertExemple_esQuery->execute($parameters);
        $insertExemple_frQuery->execute($parameters);
        $insertExemple_itQuery->execute($parameters);
        $insertExemple_ruQuery->execute($parameters);
    }

    public function deleteExample(int $example_id): void
    {
        $deleteExample_deQuery = $this->db->prepare('DELETE FROM examples_de WHERE id = :example_id');
        $deleteExample_enQuery = $this->db->prepare('DELETE FROM examples_en WHERE id = :example_id');
        $deleteExample_esQuery = $this->db->prepare('DELETE FROM examples_es WHERE id = :example_id');
        $deleteExample_frQuery = $this->db->prepare('DELETE FROM examples_fr WHERE id = :example_id');
        $deleteExample_itQuery = $this->db->prepare('DELETE FROM examples_it WHERE id = :example_id');
        $deleteExample_ruQuery = $this->db->prepare('DELETE FROM examples_ru WHERE id = :example_id');

        $parameters = [
            'example_id' => $example_id
        ];

        $deleteExample_deQuery->execute($parameters);
        $deleteExample_enQuery->execute($parameters);
        $deleteExample_esQuery->execute($parameters);
        $deleteExample_frQuery->execute($parameters);
        $deleteExample_itQuery->execute($parameters);
        $deleteExample_ruQuery->execute($parameters);
    }
}
