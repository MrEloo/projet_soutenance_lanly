<?php


class CourseManager extends AbstractManager
{
    public function getCoursesByTheirCat(int $global_category_id, int $language_id): array
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT * FROM courses WHERE courses.global_category_id = :global_category_id AND courses.language_id = :language_id');
        $parameters = ['global_category_id' => $global_category_id, 'language_id' => $language_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetchAll(PDO::FETCH_ASSOC);

        $course_array = [];


        foreach ($courses_data as $key => $course_data) {
            $gc = new GlobalCategoryManager;
            $global_category = $gc->getOneCatById($course_data['global_category_id']);
            $course = new Course($course_data['title'], $course_data['description'], $global_category);
            $course->setId($course_data['id']);
            // $course->setLocked($course_data['locked']);
            // $course->setFinished($course_data['finished']);
            $course_array[] = $course;
        }
        return $course_array;
    }

    public function getCoursesById(int $id, int $language_id): Course
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT * FROM courses WHERE courses.id = :id AND courses.language_id = :language_id');
        $parameters = ['id' => $id, 'language_id' => $language_id];
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

    public function deleteCourse(int $id): void
    {
        $deleteCourseQuery = $this->db->prepare('DELETE FROM courses WHERE id = :id ');
        $parameters = ['id' => $id];
        $deleteCourseQuery->execute($parameters);
    }

    public function updateCourse(int $id, string $title, string $description, int $category, int $language_id): void
    {
        $updateCourseQuery = $this->db->prepare('UPDATE courses SET title = :title, description = :description, global_category_id = :global_category_id, language_id = :language_id WHERE id = :id');
        $parameters = ['id' => $id, 'description' => $description, 'title' => $title, 'global_category_id' => $category, 'language_id' => $language_id];
        $updateCourseQuery->execute($parameters);
    }

    public function addCourseInUsersCourses(int $user_id, int $course_id): void
    {
        $insertCourseQuery = $this->db->prepare('INSERT INTO users_courses (user_id, course_id, locked, finished) VALUES (:user_id, :course_id, :locked, :finished)');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id, 'locked' => true, 'finished' => false];
        $insertCourseQuery->execute($parameters);
    }

    public function addCourse(string $title, string $description, int $category, int $language_id): void
    {
        $insertCourseQuery = $this->db->prepare('INSERT INTO courses (title, description, global_category_id, language_id) VALUES (:title, :description, :global_category_id, :language_id)');
        $parameters = ['title' => $title, 'description' => $description, 'global_category_id' => $category, 'language_id' => $language_id];
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

    public function getCourseByUser(int $user_id, int $course_id, int $language_id): array
    {
        $selectAllCoursesByUser = $this->db->prepare('SELECT users_courses.*, courses.* FROM users_courses JOIN courses ON courses.id = users_courses.course_id  WHERE users_courses.user_id = :user_id AND users_courses.course_id = :course_id AND courses.language_id = :language_id');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id, 'language_id' => $language_id];
        $selectAllCoursesByUser->execute($parameters);


        $courses_data = $selectAllCoursesByUser->fetchAll(PDO::FETCH_ASSOC);


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

    public function getCourseFromUserById(int $user_id, int $course_id): Course
    {
        $selectAllCoursesByCat = $this->db->prepare('SELECT courses.*, courses.id AS course_id, users_courses.finished AS users_courses_finished, users_courses.locked AS users_courses_locked FROM courses JOIN users_courses ON users_courses.course_id = courses.id WHERE users_courses.user_id = :user_id AND users_courses.course_id = :course_id');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $selectAllCoursesByCat->execute($parameters);

        $courses_data = $selectAllCoursesByCat->fetch(PDO::FETCH_ASSOC);



        $gc = new GlobalCategoryManager;
        $global_category = $gc->getOneCatById($courses_data['global_category_id']);
        $course = new Course($courses_data['title'], $courses_data['description'], $global_category);
        $course->setId($courses_data['course_id']);
        $course->setLocked($courses_data['users_courses_locked']);
        $course->setFinished($courses_data['users_courses_finished']);
        return $course;
    }

    public function getFinishedCourseByUser(int $user_id, int $course_id): ?array
    {
        $selectFinishedCourseByUser = $this->db->prepare('SELECT * FROM users_courses WHERE user_id = :user_id AND course_id = :course_id AND finished = 1');
        $parameters = ['user_id' => $user_id, 'course_id' => $course_id];
        $selectFinishedCourseByUser->execute($parameters);

        $courses_data = $selectFinishedCourseByUser->fetchAll(PDO::FETCH_ASSOC);

        $course_array = [];


        foreach ($courses_data as $key => $course_data) {
            $course_array[] = $course_data;
        }
        return $course_array;
    }

    public function getTotalCoursesByCatAndLang(int $category_id, int $language_id): int
    {
        $selectTotalCoursesByCatAndLangQuery = $this->db->prepare('SELECT COUNT(*) FROM courses WHERE global_category_id = :global_category_id AND language_id = :language_id');

        $parameters = ['global_category_id' => $category_id, 'language_id' => $language_id];
        $selectTotalCoursesByCatAndLangQuery->execute($parameters);

        $totalCourses = $selectTotalCoursesByCatAndLangQuery->fetch(PDO::FETCH_COLUMN);

        return $totalCourses;
    }

    public function getTotalFinishedCoursesByUser(int $category_id, int $user_id, int $language_id): int
    {
        $selectTotalFinishedCoursesByUserQuery = $this->db->prepare('SELECT COUNT(*) FROM users_courses JOIN courses ON courses.id = users_courses.course_id WHERE courses.global_category_id = :global_category_id AND language_id = :language_id AND users_courses.user_id = :user_id AND finished = 1');

        $parameters = ['global_category_id' => $category_id, 'language_id' => $language_id, 'user_id' => $user_id];
        $selectTotalFinishedCoursesByUserQuery->execute($parameters);

        $totalCourses = $selectTotalFinishedCoursesByUserQuery->fetch(PDO::FETCH_COLUMN);

        return $totalCourses;
    }
}
