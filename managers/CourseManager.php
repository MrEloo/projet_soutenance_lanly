<?php


class CourseManager extends AbstractManager
{
    public function getCoursesByTheirCat($global_category_id): array
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT courses.*, users_courses.locked AS users_courses_locked, users_courses.finished AS users_courses_finished FROM courses JOIN users_courses ON users_courses.course_id = courses.id WHERE global_category_id = :global_category_id');
        $parameters = ['global_category_id' => $global_category_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);


        $course_array = [];

        foreach ($courses_data as $key => $course_data) {
            $gc = new GlobalCategoryManager;
            $global_category = $gc->getOneCatById($course_data['global_category_id']);
            $course = new Course($course_data['title'], $course_data['description'], $global_category);
            $course->setId($course_data['id']);
            $course->setLocked($course_data['users_courses_locked']);
            $course->setFinished($course_data['users_courses_finished']);
            $course_array[] = $course;
        }
        return $course_array;
    }

    public function getCoursesById(int $id): Course
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT * FROM courses WHERE courses.id = :id');
        $parameters = ['id' => $id];
        $selectAllCoursesByCat->execute($parameters);

        $course_data = $selectAllCoursesByCat->fetch(PDO::FETCH_ASSOC);

        $gc = new GlobalCategoryManager;
        $global_category = $gc->getOneCatById($course_data['global_category_id']);

        $course = new Course($course_data['title'], $course_data['description'], $global_category);
        $course->setId($course_data['id']);

        return $course;
    }

    public function unlockCourse(int $user_id, int $course_id): void
    {
        $updateCourseQuery = $this->db->prepare('UPDATE users_courses SET locked = 0 WHERE user_id = :user_id AND course_id = :course_id');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $updateCourseQuery->execute($parameters);
    }

    public function isFinished(int $user_id, int $course_id): void
    {
        $updateCourseQuery = $this->db->prepare('UPDATE users_courses SET finished = 1 WHERE user_id = :user_id AND course_id = :course_id');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $updateCourseQuery->execute($parameters);
    }

    public function addCourseInUsersCourses(int $user_id, int $course_id): void
    {
        $insertCourseQuery = $this->db->prepare('INSERT INTO users_courses (user_id, course_id, locked, finished) VALUES (:user_id, :course_id, :locked, :finished)');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id, 'locked' => true, 'finished' => false];
        $insertCourseQuery->execute($parameters);
    }

    public function getAllCourse(): array
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT * FROM courses');
        $selectAllCoursesByCat->execute();

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);

        $course_array = [];


        foreach ($courses_data as $key => $course_data) {
            $gc = new GlobalCategoryManager;
            $global_category = $gc->getOneCatById($course_data['global_category_id']);
            $course = new Course($course_data['title'], $course_data['description'], $global_category);
            $course->setId($course_data['id']);
            $course_array[] = $course;
        }
        return $course_array;
    }

    public function getCourseByUser(int $user_id, int $course_id): array
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT users_courses.*, courses.* FROM users_courses JOIN courses ON courses.id = users_courses.course_id  WHERE users_courses.user_id = :user_id AND users_courses.course_id = :course_id');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $selectAllCoursesByCat->execute($parameters);


        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);


        $course_array = [];


        foreach ($courses_data as $key => $course_data) {
            $gc = new GlobalCategoryManager;
            $global_category = $gc->getOneCatById($course_data['global_category_id']);
            $course = new Course($course_data['title'], $course_data['description'], $global_category);
            $course->setId($course_data['id']);
            $course->setLocked($course_data['locked']);
            $course->setFinished($course_data['finished']);
            $course_array[] = $course;
        }
        return $course_array;
    }

    public function getAllCourseFromUser(int $user_id): array
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT courses.*, courses.id AS course_id, users_courses.finished AS users_courses_finished, users_courses.locked AS users_courses_locked FROM courses JOIN users_courses ON users_courses.course_id = courses.id WHERE users_courses.user_id = :user_id');
        $parameters = ['user_id' => $user_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);


        $course_array = [];

        foreach ($courses_data as $key => $course_data) {
            $gc = new GlobalCategoryManager;
            $global_category = $gc->getOneCatById($course_data['global_category_id']);
            $course = new Course($course_data['title'], $course_data['description'], $global_category);
            $course->setId($course_data['course_id']);
            $course->setLocked($course_data['users_courses_locked']);
            $course->setFinished($course_data['users_courses_finished']);
            $course_array[] = $course;
        }
        return $course_array;
    }
}
