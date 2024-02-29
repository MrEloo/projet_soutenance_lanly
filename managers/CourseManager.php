<?php


class CourseManager extends AbstractManager
{
    public function getCoursesByTheirCat($global_category_id): array
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT * FROM courses WHERE global_category_id = :global_category_id');
        $parameters = ['global_category_id' => $global_category_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);

        $course_array = [];

        foreach ($courses_data as $key => $course_data) {
            $course = new Course($course_data['title'], $course_data['description']);
            $course->setId($course_data['id']);
            $course_array[] = $course;
        }
        return $course_array;
    }
}
