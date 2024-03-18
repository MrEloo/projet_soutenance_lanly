<?php


class ExampleManager extends AbstractManager
{
    public function getExamplesFromCourse(int $course_id, int $language_id): array
    {
        $selectExamplesFromCourse = $this->db->prepare('SELECT * FROM examples WHERE course_id = :course_id AND language_id = :language_id');
        $parameters = ['course_id' => $course_id, 'language_id' => $language_id];
        $selectExamplesFromCourse->execute($parameters);
        $examples_data = $selectExamplesFromCourse->fetchAll(PDO::FETCH_ASSOC);

        $examples_array = [];

        foreach ($examples_data as $key => $example_data) {
            $example = new Example($example_data['description']);
            $example->setId($example_data['id']);
            $examples_array[] = $example;
        }

        return $examples_array;
    }

    public function getAllExamples(): array
    {
        $selectExamplesFromCourse = $this->db->prepare('SELECT * FROM examples');
        $selectExamplesFromCourse->execute();
        $examples_data = $selectExamplesFromCourse->fetchAll(PDO::FETCH_ASSOC);

        $examples_array = [];

        foreach ($examples_data as $key => $example_data) {
            $example = new Example($example_data['description']);
            $example->setCourse_id($example_data['course_id']);
            $example->setId($example_data['id']);
            $examples_array[] = $example;
        }

        return $examples_array;
    }

    public function updateExample(int $example_id, string $description, int $course_id, int $language_id): void
    {
        $updateExampleQuery = $this->db->prepare('UPDATE examples SET description = :description, course_id = :course_id, language_id = :language_id WHERE id = :example_id');

        $parameters = [
            'example_id' => $example_id,
            'description' => $description,
            'course_id' => $course_id,
            'language_id' => $language_id,
        ];

        $updateExampleQuery->execute($parameters);
    }

    public function addExample(string $description, int $course_id, int $language_id): void
    {
        $insertExempleQuery = $this->db->prepare('INSERT INTO examples (description, course_id, language_id) VALUES (:description, :course_id, :language_id)');

        $parameters = [
            'description' => $description,
            'course_id' => $course_id,
            'language_id' => $language_id
        ];

        $insertExempleQuery->execute($parameters);
    }
    public function deleteExample(int $example_id): void
    {
        $deleteExampleQuery = $this->db->prepare('DELETE FROM examples WHERE id = :example_id');

        $parameters = [
            'example_id' => $example_id
        ];

        $deleteExampleQuery->execute($parameters);
    }
}
