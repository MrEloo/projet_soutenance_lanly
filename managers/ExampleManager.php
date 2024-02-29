<?php


class ExampleManager extends AbstractManager
{
    public function getExamplesFromCourse(int $course_id): array
    {
        $selectExamplesFromCourse = $this->db->prepare('SELECT * FROM examples WHERE course_id = :course_id');
        $parameters = ['course_id' => $course_id];
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
}
